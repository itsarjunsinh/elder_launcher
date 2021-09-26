import 'dart:async';
import 'dart:collection';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../constants/channels.dart';
import '../constants/keys.dart';
import '../data_sources/app_repository.dart';
import '../models/item.dart';
import '../utils/native_methods.dart';
import '../utils/shared_prefs.dart';

class AppModel extends ChangeNotifier {
  bool _isAppListLoaded = false;
  bool _isFavListLoaded = false;
  bool _canSetDefaultLauncher = false;

  List<Item> _allApps = [];
  List<Item> _favApps = [];

  final _appEvent = DeviceApps.listenToAppsChanges();
  final _methodChannel = const MethodChannel(channelCore);
  late final Timer _refreshTimer;

  AppModel() {
    _loadApps();
    _appEvent.listen((event) {
      _loadApps();
    });
    _refreshTimer =
        Timer.periodic(const Duration(minutes: 15), (timer) => _loadApps());
    _checkCanSetDefaultLauncher();
    _methodChannel.setMethodCallHandler(_failedSettingDefaultLauncher);
  }

  bool get canSetDefaultLauncher => _canSetDefaultLauncher;
  bool get isAppListLoaded => _isAppListLoaded;
  bool get isFavListLoaded => _isFavListLoaded;
  UnmodifiableListView<Item> get allApps => UnmodifiableListView(_allApps);
  UnmodifiableListView<Item> get favApps => UnmodifiableListView(_favApps);

  @override
  void dispose() {
    _appEvent.listen((event) {}).cancel();
    _refreshTimer.cancel();
    super.dispose();
  }

  Future<void> _loadApps() async {
    _loadAllItems();
    _loadFavItems();
    var isFirstRun = await SharedPrefs().getBool(keyIsFirstRun, true);
    if (isFirstRun) {
      _restoreFavAppsFromDeprecatedList();
    }
  }

  Future<void> _loadAllItems() async {
    _allApps = await AppRepository().getAllItems();
    _isAppListLoaded = true;
    notifyListeners();
  }

  Future<void> _loadFavItems() async {
    _favApps = await AppRepository().getFavItems();
    _isFavListLoaded = true;
    notifyListeners();
  }

  Future<void> _checkCanSetDefaultLauncher() async {
    var result = await NativeMethods().canSetDefaultLauncher();
    _canSetDefaultLauncher = result;
    notifyListeners();
  }

  /// Restore favourite apps saved with different key in builds prior to v1.0
  Future<void> _restoreFavAppsFromDeprecatedList() async {
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

  Future<void> saveFavApps(List<String> newFavPackages) async {
    AppRepository().setFavItems(newFavPackages);
    _loadFavItems();
  }

  void setDefaultLauncher() {
    _canSetDefaultLauncher = false; // Hide the dialog
    NativeMethods().setDefaultLauncher();
    notifyListeners();
  }

  Future<void> _failedSettingDefaultLauncher(MethodCall call) async {
    switch (call.method) {
      case 'setDefaultLauncherFailure':
        // Confirm and show set default dialog
        _checkCanSetDefaultLauncher();
    }
  }
}
