import 'package:flutter/services.dart';
import '../constants/channels.dart';

class NativeMethods {
  final platformCore = MethodChannel(channelCore);
  final platformContacts = MethodChannel(channelContacts);

  /*
  ** Contacts & Call
  */

  Future<bool> hasTelephoneFeature() async {
    return platformContacts.invokeMethod<bool>('hasTelephoneFeature');
  }

  void launchContactsApp() {
    platformContacts.invokeMethod('launchContactsApp');
  }

  void launchDialerApp(String number) {
    platformContacts.invokeMethod('launchDialerWithNumber', {'number': number});
  }

  void startPhoneCall(String number) {
    platformContacts.invokeMethod('startPhoneCall', {'number': number});
  }

  /*
  ** Core
  */

  Future<bool> canSetDefaultLauncher() async {
    return platformCore.invokeMethod<bool>('canSetDefaultLauncher');
  }

  void setDefaultLauncher() {
    platformCore.invokeMethod('setDefaultLauncher');
  }

  Future<List<String>> getDeprecatedPrefsList() async {
    var stringList = <String>[];
    try {
      stringList =
          await platformCore.invokeListMethod<String>('getDeprecatedFavAppIds');
    } on PlatformException catch (e) {
      print(e);
    }
    return stringList;
  }
}
