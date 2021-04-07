import 'dart:async';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:device_apps/device_apps.dart';
import '../constants/keys.dart';
import '../data_sources/app_repository.dart';
import '../models/item.dart';
import '../utils/native_methods.dart';
import '../utils/shared_prefs.dart';

class AppModel extends ChangeNotifier {
  bool _isAppListLoaded = false;
  bool _isFavListLoaded = false;

  List<Item> _allApps = [];
  List<Item> _favApps = [];

  Timer _refreshTimer;

  AppModel() {
    _loadApps();
    _refreshTimer =
        Timer.periodic(Duration(minutes: 05), (timer) => _loadApps());
  }

  bool get isAppListLoaded => _isAppListLoaded;
  bool get isFavListLoaded => _isFavListLoaded;
  UnmodifiableListView<Item> get allApps => UnmodifiableListView(_allApps);
  UnmodifiableListView<Item> get favApps => UnmodifiableListView(_favApps);

  @override
  void dispose() {
    _refreshTimer.cancel();
    super.dispose();
  }

  void _loadApps() async {
    _loadAllItems();
    _loadFavItems();
    var isFirstRun = await SharedPrefs().getBool(keyIsFirstRun, true);
    if (isFirstRun) {
      _restoreFavAppsFromDeprecatedList();
    }
  }

  void _loadAllItems() async {
    _allApps = await AppRepository().getAllItems();
    _isAppListLoaded = true;
    notifyListeners();
  }

  void _loadFavItems() async {
    _favApps = await AppRepository().getFavItems();
    _isFavListLoaded = true;
    notifyListeners();
  }

  /// Restore favourite apps saved with different key in builds prior to v1.0
  void _restoreFavAppsFromDeprecatedList() async {
    var deprecatedFavAppIds = await NativeMethods().getDeprecatedPrefsList();
    if (deprecatedFavAppIds.isNotEmpty) {
      saveFavApps(deprecatedFavAppIds);
    }
    SharedPrefs().setBool(keyIsFirstRun, false);
  }

  void launchApp(String packageName) {
    DeviceApps.openApp(packageName);
  }

  void reloadLists() {
    _loadApps();
  }

  void saveFavApps(List<String> newFavPackages) async {
    AppRepository().setFavItems(newFavPackages);
    _loadFavItems();
  }
}
