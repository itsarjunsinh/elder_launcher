import 'package:elder_launcher/ui/colors.dart';
import 'package:flutter/material.dart';

var lightTheme = ThemeData(
    primaryColor: elderTeal,
    accentColor: elderPink,
    backgroundColor: elderWhite,
    cardColor: elderBlueGrey,
    textTheme: Typography.blackMountainView);

var darkTheme = ThemeData(
    primaryColor: elderDarkGrey,
    accentColor: elderPink,
    backgroundColor: elderBlack,
    cardColor: elderDarkGreySecondary,
    dividerTheme: DividerThemeData(color: elderBlueGrey),
    textTheme: Typography.whiteMountainView);

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
  static const dialogAction = TextStyle(color: Colors.brown, fontSize: 22);
  static const dialogActionMain =
      TextStyle(color: Colors.black87, fontSize: 25);
}

class Values {
  static const double dividerThickness = 2;
  static const double primaryButtonHeight = 55;
  static const double fabSafeBottomPadding = 45;
}
