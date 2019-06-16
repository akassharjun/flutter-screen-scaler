library flutter_screen_scaler;

import 'dart:core';

import 'package:flutter/material.dart';

/// A package to resize your widgets according to the screen size with the use of percentages.
class ScreenScaler {
  static double _screenWidth = 1080.0;
  static double _screenHeight = 1920.0;

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
  }

  /// Returns the width equivalent of the [percentage] provided.
  double getWidth(double percentage) => _screenWidth * (percentage / 100);

  /// Returns the height equivalent of the [percentage] provided.
  double getHeight(double percentage) => _screenHeight * (percentage / 100);

  /// Returns the text size for the [percentage] provided.
  double getTextSize(double percentage) =>
      percentage / 100 * (getHeight(percentage) + getWidth(percentage));
}
