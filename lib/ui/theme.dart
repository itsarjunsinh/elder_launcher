import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

/* Light Themes */
ThemeData baseLightTheme = ThemeData.from(
    colorScheme: const ColorScheme.light(
      background: youCard,
      secondary: youBlue,
      surface: elderBlueGrey,
    ),
    textTheme: Typography.blackMountainView);

ThemeData tealTheme = baseLightTheme.copyWith(
  colorScheme: baseLightTheme.colorScheme.copyWith(
    primary: elderTeal,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: youPeach,
  ),
  primaryColor: elderTeal,
  splashColor: elderTeal,
);

/* Dark Themes */
ThemeData baseDarkTheme = ThemeData.from(
    colorScheme: const ColorScheme.dark(
      background: youBlackDim,
      primary: youBlack,
      secondary: youBlue,
      surface: elderDarkGrey,
    ),
    textTheme: Typography.whiteMountainView);

ThemeData darkTheme = baseDarkTheme.copyWith(
  appBarTheme: const AppBarTheme(color: youBlack),
  cupertinoOverrideTheme: const CupertinoThemeData(
    primaryColor: elderWhite,
  ),
  dividerTheme: const DividerThemeData(color: elderDarkGreySecondary),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: youPeach,
  ),
  primaryColor: youBlack,
  splashColor: elderBlack,
);

class TextStyles {
  static const cardTitle = TextStyle(fontSize: 30);
  static const listTitle = TextStyle(fontSize: 30);
  static const headerTime = TextStyle(fontSize: 40);
  static const headerDate = TextStyle(color: Colors.white, fontSize: 30);
  static const infoMessage = TextStyle(fontSize: 25);
  static const actionButtonLabel = TextStyle(color: Colors.white, fontSize: 30);
  static const primaryButtonLabel =
      TextStyle(color: Colors.white, fontSize: 50, height: 1);
  static const dialogTitle = TextStyle(fontSize: 25);
  static const dialogSubtitle = TextStyle(fontSize: 24);
  static const dialogAction = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static const dialogActionMain = TextStyle(fontSize: 25);
}

class Values {
  static const double dividerThickness = 2;
  static const double primaryButtonHeight = 55;
  static const double fabSafeBottomPadding = 45;
}
