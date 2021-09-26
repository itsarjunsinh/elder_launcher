import 'package:elder_launcher/models/item.dart';

const fakeAllApps = [
  Item('dev.arjunsinh.calc', 'Calculator', null),
  Item('dev.arjunsinh.calendar', 'Calendar', null),
  Item('dev.arjunsinh.cam', 'Camera', null),
  Item('dev.arjunsinh.clock', 'Clock', null),
  Item('dev.arjunsinh.contacts', 'Contacts', null),
  Item('dev.arjunsinh.email', 'E-mail', null),
  Item('dev.arjunsinh.files', 'Files', null),
  Item('dev.arjunsinh.gallery', 'Gallery', null),
  Item('dev.arjunsinh.messages', 'Messages', null),
  Item('dev.arjunsinh.music', 'Music Player', null),
  Item('dev.arjunsinh.phone', 'Phone', null),
  Item('dev.arjunsinh.settings', 'Settings', null),
  Item('dev.arjunsinh.video', 'Video Player', null)
];

const fakeFavPackageNames = [
  'dev.arjunsinh.cam',
  'dev.arjunsinh.files',
  'dev.arjunsinh.gallery',
  'dev.arjunsinh.phone'
];

List<Item> get fakeFavApps {
  var favApps = <Item>[];
  for (var packageName in fakeFavPackageNames) {
    final fakeApp = fakeAllApps.firstWhere((item) => item.id == packageName);
    favApps.add(fakeApp);
  }
  return favApps;
}

/// Mock list of installed apps for the DeviceApps package.
List<Map<String, Object>> get fakeInstalledApps {
  var applicationList = <Map<String, Object>>[];
  for (var fakeApp in fakeAllApps) {
    final application = Map.from(_baseApplication).cast<String, Object>();
    application['app_name'] = fakeApp.name;
    application['package_name'] = fakeApp.id;
    applicationList.add(application);
  }
  return applicationList;
}

/// Mock application hashmap used in DeviceApps package.
const _baseApplication = {
  'apk_file_path': '',
  'app_icon': '',
  'app_name': '',
  'category': 8,
  'data_dir': '',
  'install_time': 1,
  'is_enabled': true,
  'package_name': '',
  'system_app': true,
  'update_time': 1,
  'version_code': 12,
  'version_name': '12.0',
};
