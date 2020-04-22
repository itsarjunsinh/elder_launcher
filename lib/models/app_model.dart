import 'dart:async';
import 'dart:collection';
import 'package:device_apps/device_apps.dart';
import 'package:elder_launcher/constants/keys.dart';
import 'package:elder_launcher/models/interfaces/data_repository.dart';
import 'package:elder_launcher/models/item.dart';
import 'package:elder_launcher/utils/native_methods.dart';
import 'package:elder_launcher/utils/shared_prefs.dart';
import 'package:flutter/cupertino.dart';

class AppModel extends ChangeNotifier {
  final DataRepository dataRepository;

  bool _isAppListLoaded = false;
  bool _isFavListLoaded = false;

  List<Item> _allApps = [];
  List<Item> _favApps = [];

  Timer _refreshTimer;

  AppModel({@required this.dataRepository}) {
    _loadApps();
    _refreshTimer = Timer.periodic(Duration(minutes: 10), (Timer timer) => _loadApps());
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
    bool isFirstRun = await SharedPrefs().getBool(keyIsFirstRun, true);
    if (isFirstRun) {
      _restoreFavAppsFromDeprecatedList();
    }
  }

  void _loadAllItems() async {
    _allApps = await dataRepository.getAllItems();
    _isAppListLoaded = true;
    notifyListeners();
  }

  void _loadFavItems() async {
    _favApps = await dataRepository.getFavItems();
    _isFavListLoaded = true;
    notifyListeners();
  }

  /// Restore favourite apps saved by previous builds with a different key
  void _restoreFavAppsFromDeprecatedList() async {
    List<String> deprecatedFavAppIds =
        await NativeMethods().getDeprecatedPrefsList();
    if (deprecatedFavAppIds.isNotEmpty) {
      saveFavApps(deprecatedFavAppIds);
    }
    SharedPrefs().setBool(keyIsFirstRun, false);
  }

  void launchApp(String packageName) {
    DeviceApps.openApp(packageName);
  }

  void saveFavApps(List<String> newFavPackages) async {
    dataRepository.setFavItems(newFavPackages);
    _loadFavItems();
  }
}
