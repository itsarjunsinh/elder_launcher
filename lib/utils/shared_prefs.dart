import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<List<String>> getList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringList = (prefs.getStringList(key) ?? []);
    return stringList;
  }

  void setList(String key, List<String> stringList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, stringList);
  }

  Future<bool> getBool(String key, bool defaultValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? defaultValue;
  }

  void setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
}
