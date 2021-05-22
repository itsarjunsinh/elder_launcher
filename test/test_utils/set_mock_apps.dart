import 'package:collection/collection.dart';
import 'package:elder_launcher/constants/keys.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../test_data/fake_apps.dart';

void setMockApps() {
  SharedPreferences.setMockInitialValues(
      <String, Object>{'flutter.$keyFavApps': fakeFavPackageNames});

  const deviceAppsChannel = MethodChannel('g123k/device_apps');
  final allApps = fakeInstalledApps;

  deviceAppsChannel.setMockMethodCallHandler((call) async {
    if (call.method == 'getInstalledApps') {
      return allApps;
    }

    if (call.method == 'getApp') {
      return allApps.firstWhereOrNull(
          (app) => app['package_name'] == call.arguments['package_name']);
    }
  });
}
