import 'dart:typed_data';
import 'package:device_apps/device_apps.dart';
import 'package:elder_launcher/constants/keys.dart';
import 'package:elder_launcher/models/interfaces/data_repository.dart';
import 'package:elder_launcher/models/item.dart';
import 'package:elder_launcher/utils/shared_prefs.dart';

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
    List<String> favPackages = await SharedPrefs().getList(keyFavApps);
    List<ApplicationWithIcon> favApps = [];

    for (String packageName in favPackages) {
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
    List<Item> _apps = [];

    for (final app in apps) {
      if (app != null) {
        _apps.add(Item(app.packageName, app.appName,
            app is ApplicationWithIcon ? app.icon as Uint8List : null));
      }
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
