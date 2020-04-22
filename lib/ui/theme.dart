import 'package:elder_launcher/ui/colors.dart';
import 'package:flutter/material.dart';

var lightTheme = ThemeData(
    primarySwatch: Colors.brown,
    primaryColor: elderBlueGrey,
    cardColor: elderBlueGreySecondary,
    accentColor: elderPink);

class LightColors {
  static const elderBlueGrey = Color(0xFF407577);
  static const elderBlueGreySecondary = Color(0xFFCFD8DC);
  static const elderPink = Color(0xFFF9316A);
  static const elderWhite = Color(0xFFFAFAFA);
}

class TextStyles {
  static const cardTitle = TextStyle(fontSize: 30);
  static const listTitle = TextStyle(fontSize: 30);
  static const headerTime = TextStyle(fontSize: 40);
  static const headerDate = TextStyle(color: Colors.white, fontSize: 30);
  static const infoMessage = TextStyle(fontSize: 25);
  static const actionButtonLabel = TextStyle(fontSize: 30);
  static const primaryButtonLabel =
      TextStyle(color: Colors.white, fontSize: 50, height: 1);
  static const dialogTitle = TextStyle(color: Colors.black, fontSize: 25);
}

class Values {
  static const double dividerThickness = 2;
  static const double primaryButtonHeight = 55;
  static const double fabSafeBottomPadding = 45;
}
