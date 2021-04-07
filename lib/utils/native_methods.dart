import 'package:flutter/services.dart';

class NativeMethods {
  final platform = MethodChannel('arjunsinh.xyz/elder_launcher');

  void launchContactsApp() {
    platform.invokeMethod('launchContactsApp');
  }

  void launchDialerApp(String number) {
    platform.invokeMethod('launchDialerWithNumber', {'number': number});
  }

  void startPhoneCall(String number) {
    platform.invokeMethod('startPhoneCall', {'number': number});
  }

  Future<bool> hasTelephoneFeature() async {
    return await platform.invokeMethod<bool>('hasTelephoneFeature');
  }

  Future<List<String>> getDeprecatedPrefsList() async {
    var stringList = <String>[];
    try {
      stringList =
          await platform.invokeListMethod<String>('getDeprecatedFavAppIds');
    } on PlatformException catch (e) {
      print(e);
    }
    return stringList;
  }
}
