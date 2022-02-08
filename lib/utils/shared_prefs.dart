import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<List<String>> getList(String key) async {
    var prefs = await SharedPreferences.getInstance();
    var stringList = prefs.getStringList(key) ?? [];
    return stringList;
  }

  Future<void> setList(String key, List<String> stringList) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, stringList);
  }

  // ignore: avoid_positional_boolean_parameters
  Future<bool> getBool(String key, bool defaultValue) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? defaultValue;
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> setBool(String key, bool value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<int> getInt(String key, int defaultValue) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? defaultValue;
  }

  Future<void> setInt(String key, int value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }
}
