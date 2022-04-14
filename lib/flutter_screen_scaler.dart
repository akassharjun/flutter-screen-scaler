library flutter_screen_scaler;

import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

/// A package to scale your widgets according to the screen size with the use of percentages.
class ScreenScaler {
  double _screenWidth = 1080.0;
  double _screenHeight = 1920.0;

  static const double _fixedWidth = 410; // Set to an Aspect Ratio of 2:1 (h:w)
  static const double _fixedHeight = 820; // Set to an Aspect Ratio of 2:1 (h:w)

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
  }

  static double _roundToDecimals(double val, int decimalPlaces) {
    num mod = pow(10.0, decimalPlaces);
    return ((val * mod).round().toDouble() / mod);
  }

  /// Returns the width equivalent of the [percentage] provided.
  double getWidth(double? percentage) {
    final int _decPlaces = 5;

    _screenWidth = _screenWidth
        .floorToDouble(); // Extracts Device Screen maximum percentage.

    double _rsWidth = 0;
    if (_screenWidth == _fixedWidth) {
      // If input percentage matches fixedWidth then do normal scaling.
      _rsWidth =
          _roundToDecimals((_screenWidth * (percentage! / 100)), _decPlaces);
    } else {
      // If input percentage !match fixedWidth then do adjustment factor scaling.
      double _scaleRatioWidth =
          _roundToDecimals((_screenWidth / _fixedWidth), _decPlaces);
      double _scalerWidth =
          ((percentage! + log(percentage + 1)) * pow(1, _scaleRatioWidth)) /
              100;
      _rsWidth = _roundToDecimals((_screenWidth * _scalerWidth), _decPlaces);
    }

    return _screenWidth * percentage/100;
  }

  /// Returns the height equivalent of the [percentage] provided.
  double getHeight(double? percentage) {
    final int _decPlaces = 5;

    _screenHeight = _screenHeight
        .floorToDouble(); // Extracts Device Screen maximum percentage.

    double _rsHeight = 0;
    if (_screenHeight == _fixedHeight) {
      // If input percentage matches fixedHeight then do normal scaling.
      _rsHeight =
          _roundToDecimals((_screenHeight * (percentage! / 100)), _decPlaces);
    } else {
      // If input percentage !match fixedHeight then do adjustment factor scaling.
      double _scaleRatioHeight =
          _roundToDecimals((_screenHeight / _fixedHeight), _decPlaces);
      double _scalerHeight =
          ((percentage! + log(percentage + 1)) * pow(1, _scaleRatioHeight)) /
              100;
      _rsHeight = _roundToDecimals((_screenHeight * _scalerHeight), _decPlaces);
    }

    return _screenHeight * percentage/100;
  }

  /// Returns the text size for the [percentage] provided.
  double getTextSize(
    double? percentage,
  ) =>
      percentage! / 100 * (getHeight(percentage) + getWidth(percentage));

  /// Returns the dynamic size for the [percentage] provided.
  double getFullScreen(
    double percentage,
  ) =>
      percentage / 100 * (getHeight(percentage) + getWidth(percentage));

  /// Returns the dynamic padding sizes for the [height] and [width] percentages provided.
  EdgeInsetsGeometry getPadding(
    double height,
    double width,
  ) =>
      EdgeInsets.fromLTRB(
        getWidth(width),
        getHeight(height),
        getWidth(width),
        getHeight(height),
      );

  /// Returns the dynamic padding sizes for the [height] percentage provided.
  EdgeInsetsGeometry getPaddingByHeight(
    double height,
  ) =>
      EdgeInsets.fromLTRB(
        getHeight(height),
        getHeight(height),
        getHeight(height),
        getHeight(height),
      );

  /// Returns the dynamic padding sizes for the [width] percentage provided.
  EdgeInsetsGeometry getPaddingByWidth(
    double width,
  ) =>
      EdgeInsets.fromLTRB(
        getHeight(width),
        getHeight(width),
        getHeight(width),
        getHeight(width),
      );

  /// Returns the dynamic padding size for the [left], [top], [right], [bottom] percentages provided.
  EdgeInsetsGeometry getPaddingLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) =>
      EdgeInsets.fromLTRB(
        getWidth(left),
        getHeight(top),
        getWidth(right),
        getHeight(bottom),
      );

  /// Returns the dynamic padding size for the [percentage] provided.
  EdgeInsetsGeometry getPaddingAll(double all) =>
      EdgeInsets.all(getFullScreen(all));

  /// Returns the dynamic margin size for the [height] and [width] percentages provided.
  EdgeInsetsGeometry getMargin(
    double height,
    double width,
  ) =>
      EdgeInsets.fromLTRB(
        getWidth(width),
        getHeight(height),
        getWidth(width),
        getHeight(height),
      );

  /// Returns the dynamic margin size for the [height] percentage provided.
  EdgeInsetsGeometry getMarginByHeight(
    double height,
  ) =>
      EdgeInsets.fromLTRB(
        getHeight(height),
        getHeight(height),
        getHeight(height),
        getHeight(height),
      );

  /// Returns the dynamic margin size for the [width] percentage provided.
  EdgeInsetsGeometry getMarginByWidth(
    double width,
  ) =>
      EdgeInsets.fromLTRB(
        getHeight(width),
        getHeight(width),
        getHeight(width),
        getHeight(width),
      );

  /// Returns the dynamic margin sizes for the [left], [top], [right], [bottom] percentages provided.
  EdgeInsetsGeometry getMarginLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) =>
      EdgeInsets.fromLTRB(
        getWidth(left),
        getHeight(top),
        getWidth(right),
        getHeight(bottom),
      );

  /// Returns the dynamic margin size for the [percentage] provided.
  EdgeInsetsGeometry getMarginAll(
    double percentage,
  ) =>
      EdgeInsets.all(getFullScreen(percentage));

  /// Returns the dynamic border radius size for the [radius] percentage provided.
  BorderRadius getBorderRadiusCircular(
    double radius,
  ) =>
      BorderRadius.circular(getFullScreen(radius));

  /// Returns the dynamic border radius size for the [topLeft], [topRigt], [bottomLeft] & [bottomRight] percentages provided.
  BorderRadius getBorderRadiusCircularLR(
    double topLeft,
    double topRight,
    double bottomLeft,
    double bottomRight,
  ) =>
      BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      );

  /// Returns the dynamic border radius size for the [radius] height percentage provided.
  BorderRadius getBorderRadiusCircularByHeight(
    double radius,
  ) =>
      BorderRadius.circular(
        getHeight(radius),
      );

  /// Returns the dynamic border radius size for the [radius] width percentage provided.
  BorderRadius getBorderRadiusCircularByWidth(
    double radius,
  ) =>
      BorderRadius.circular(
        getHeight(radius),
      );
}
