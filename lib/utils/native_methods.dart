import 'package:flutter/services.dart';
import '../constants/channels.dart';

class NativeMethods {
  final platformCore = MethodChannel(channelCore);
  final platformContacts = MethodChannel(channelContacts);

  /*
  ** Contacts & Call
  */

  Future<bool> hasTelephoneFeature() async {
    var hasTelephoneFeatureResult =
        await platformContacts.invokeMethod<bool>('hasTelephoneFeature');
    return hasTelephoneFeatureResult != null
        ? hasTelephoneFeatureResult
        : false;
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
    var canSetDefaultLauncherResult =
        await platformCore.invokeMethod<bool>('canSetDefaultLauncher');
    return canSetDefaultLauncherResult != null
        ? canSetDefaultLauncherResult
        : false;
  }

  void setDefaultLauncher() {
    platformCore.invokeMethod('setDefaultLauncher');
  }

  Future<List<String>> getDeprecatedPrefsList() async {
    var favAppsInDeprecatedList =
        await platformCore.invokeListMethod<String>('getDeprecatedFavAppIds');
    return favAppsInDeprecatedList != null
        ? favAppsInDeprecatedList
        : <String>[];
  }
}
