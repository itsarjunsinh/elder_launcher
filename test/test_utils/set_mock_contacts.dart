import 'package:collection/collection.dart';
import 'package:elder_launcher/constants/keys.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../test_data/fake_contacts.dart';

void setMockContacts() {
  SharedPreferences.setMockInitialValues(
      <String, Object>{'flutter.$keyFavContacts': fakeFavContactNumbers});

  const contactsChannel =
      MethodChannel('github.com/clovisnicolas/flutter_contacts');
  final allContacts = fakeDeviceContacts;

  contactsChannel.setMockMethodCallHandler((call) async {
    if (call.method == 'getContacts') {
      print(call.arguments);
      print("Returning");
      return allContacts;
    }

    /*if (call.method == 'getApp') {
      return allContacts.firstWhereOrNull(
          (contact) => app['package_name'] == call.arguments['package_name']);
    }*/
  });
}
