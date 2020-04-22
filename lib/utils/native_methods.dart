import 'package:flutter/services.dart';

class NativeMethods {
  final platform = MethodChannel('arjunsinh.xyz/elder_launcher');

  launchContactsApp() {
    platform.invokeMethod('launchContactsApp');
  }

  launchDialerApp(String number) {
    platform.invokeMethod('launchDialerWithNumber', {'number': number});
  }

  Future<List<String>> getDeprecatedPrefsList() async {
    List<String> stringList = [];
    try {
      stringList =
          await platform.invokeListMethod<String>('getDeprecatedFavAppIds');
    } on PlatformException catch (e) {
      print(e);
    }
    return stringList;
  }
}
