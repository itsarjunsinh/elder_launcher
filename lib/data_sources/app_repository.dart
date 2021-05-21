import 'dart:typed_data';
import 'package:device_apps/device_apps.dart';
import '../constants/keys.dart';
import '../models/interfaces/data_repository.dart';
import '../models/item.dart';
import '../utils/shared_prefs.dart';

class AppRepository implements DataRepository {
  @override
  Future<List<Item>> getAllItems() async {
    var allApps = await DeviceApps.getInstalledApplications(
        includeAppIcons: true,
        includeSystemApps: true,
        onlyAppsWithLaunchIntent: true);
    return _sortItems(await _toItems(allApps));
  }

  @override
  Future<List<Item>> getFavItems() async {
    var favPackages = await SharedPrefs().getList(keyFavApps);
    var favApps = <ApplicationWithIcon>[];

    for (var packageName in favPackages) {
      var app = await DeviceApps.getApp(packageName, true);
      favApps.add(app as ApplicationWithIcon);
    }

    return _toItems(favApps);
  }

  @override
  void setFavItems(List<String> favPackages) {
    SharedPrefs().setList(keyFavApps, favPackages);
  }

  Future<List<Item>> _toItems(List<Application> apps) async {
    var _apps = <Item>[];

    for (final app in apps) {
      _apps.add(
        Item(
            app.packageName,
            app.appName,
            app is ApplicationWithIcon
                ? app.icon as Uint8List // ignore: unnecessary_cast
                : null),
      );
    }

    return _apps;
  }

  // TODO: Sort Apps as per locale and pronounciation
  Future<List<Item>> _sortItems(List<Item> apps) async {
    apps.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    /*
    unorm sort causing slowdown
    _apps.sort((a, b) => unorm.nfd(a.name).compareTo(unorm.nfd(b.name)));
    */
    return apps;
  }
}
