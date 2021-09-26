/*
import 'package:collection/collection.dart';
import 'package:elder_launcher/constants/keys.dart';
import 'package:elder_launcher/data_sources/contact_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../test_data/fake_contacts.dart';
import '../test_utils/set_mock_contacts.dart';
*/

void main() {
  /*
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    setMockContacts();
  });

  test('Loads all contacts', () async {
    await ContactRepository().getAllItems().then(
      (allContacts) {
        //for (var contact in allContacts) print(contact.name);
        //expect(allContacts, fakeAllContacts);
      },
    );
  });

  test('Loads fav apps', () async {
    await AppRepository().getFavItems().then(
      (favApps) {
        expect(favApps, fakeFavApps);
      },
    );
  });

  group('Scenario: Missing Fav App', () {
    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      // Add package name of app that isn't installed
      final packageNames = fakeFavPackageNames.toList();
      packageNames.add('com.doesntexist');

      SharedPreferences.setMockInitialValues(
          <String, Object>{'flutter.$keyFavApps': packageNames});

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
    });

    test('Excludes missing fav app', () async {
      await AppRepository().getFavItems().then(
        (favApps) {
          // Loads favourite apps excluding the one that doesn't exist
          expect(favApps, fakeFavApps);
        },
      );
    });
  });*/
}
