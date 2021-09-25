import 'package:flutter/material.dart';
import '../ui/colors.dart';

class ColorUtil {
  /// Returns black colour in light mode, white in dark mode.
  Color colorOnPrimary(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return elderBlack;
    } else {
      return elderWhite;
    }
  }
}
