import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/keys.dart';
import '../constants/theme_ids.dart';
import '../ui/theme.dart';
import '../utils/shared_prefs.dart';

class SettingsModel extends ChangeNotifier {
  ThemeData currentTheme = tealTheme;
  int currentThemeId = themeIds[0];
  int? themeVal = themeIds[0];

  SettingsModel() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    var selectedTheme =
        await SharedPrefs().getInt(keySelectedTheme, tealThemeId);
    _applyTheme(selectedTheme);
  }

  void _applyTheme(int themeId) {
    // Check default (teal) and dark theme first.
    switch (themeId) {
      case tealThemeId:
        currentTheme = tealTheme;
        break;
      case darkThemeId:
        currentTheme = darkTheme;
        break;
      case blueThemeId:
        //currentTheme = blueTheme;
        break;
    }
    notifyListeners();
  }

  Future<void> setTheme(int themeId) async {
    _applyTheme(themeId);
    SharedPrefs().setInt(keySelectedTheme, themeId);
  }
}
