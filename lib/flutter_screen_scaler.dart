library flutter_screen_scaler;

import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

/// A utility class to scale widget dimensions and spacing based on screen size percentages.
///
/// Initialize with [ScreenScaler.init(context)] before use.
/// Provides methods to get dimensions (width, height, text size) and
/// EdgeInsets or BorderRadius values scaled by a direct percentage of screen dimensions.
///
/// Also provides convenient extension methods on `num` (e.g., `50.h`, `30.w`)
/// for concise scaling after initialization.
class ScreenScaler {
  // --- Singleton Setup ---
  ScreenScaler._privateConstructor();
  static final ScreenScaler I = ScreenScaler._privateConstructor();
  // --- End Singleton Setup ---

  double _screenWidth = 1080.0; // Default, updated by init()
  double _screenHeight = 1920.0; // Default, updated by init()
  bool _isInitialized = false;

  /// Default number of decimal places for rounding scaled values.
  static const int _kDefaultDecimalPlaces = 5;

  /// Reference screen width for scaling text sizes using the .sp extension.
  static const double _kReferenceScreenWidthForText = 375.0;

  /// Initializes the [ScreenScaler] with actual screen dimensions from [BuildContext].
  /// Call once before using scaling methods or extension getters like .h, .w.
  static void init(BuildContext context) {
    I._screenWidth = MediaQuery.sizeOf(context).width;
    I._screenHeight = MediaQuery.sizeOf(context).height;
    I._isInitialized = true;
  }

  void _checkInitialized() {
    if (!I._isInitialized) {
      debugPrint(
          "Warning: ScreenScaler is not initialized. Call ScreenScaler.init(context) first. Using default screen dimensions.");
    }
  }

  /// Rounds a [value] to a specified number of [decimalPlaces].
  static double _roundToDecimals(double value, int decimalPlaces) {
    num mod = pow(10.0, decimalPlaces);
    return ((value * mod).round().toDouble() / mod);
  }

  /// Returns a width equivalent to the given [percentage] of the screen width.
  ///
  /// [percentage]: The percentage (e.g., 50 for 50%) of the screen width.
  /// Returns the calculated width, rounded to [_kDefaultDecimalPlaces].
  double getWidth(double percentage) {
    _checkInitialized();
    return _roundToDecimals(
        (_screenWidth * (percentage / 100.0)), _kDefaultDecimalPlaces);
  }

  /// Returns a height equivalent to the given [percentage] of the screen height.
  ///
  /// [percentage]: The percentage (e.g., 50 for 50%) of the screen height.
  /// Returns the calculated height, rounded to [_kDefaultDecimalPlaces].
  double getHeight(double percentage) {
    _checkInitialized();
    return _roundToDecimals(
        (_screenHeight * (percentage / 100.0)), _kDefaultDecimalPlaces);
  }

  /// Returns a width equivalent to the given [percentage] of the [parentSize.width].
  ///
  /// [parentSize]: The size of the parent widget.
  /// [percentage]: The percentage (e.g., 50 for 50%) of the parent's width.
  /// Returns the calculated width, rounded to [_kDefaultDecimalPlaces].
  double scaleWidthFrom(Size parentSize, double percentage) {
    // No _checkInitialized needed here as it doesn't use screen dimensions
    return _roundToDecimals(
        (parentSize.width * (percentage / 100.0)), _kDefaultDecimalPlaces);
  }

  /// Returns a height equivalent to the given [percentage] of the [parentSize.height].
  ///
  /// [parentSize]: The size of the parent widget.
  /// [percentage]: The percentage (e.g., 50 for 50%) of the parent's height.
  /// Returns the calculated height, rounded to [_kDefaultDecimalPlaces].
  double scaleHeightFrom(Size parentSize, double percentage) {
    // No _checkInitialized needed here as it doesn't use screen dimensions
    return _roundToDecimals(
        (parentSize.height * (percentage / 100.0)), _kDefaultDecimalPlaces);
  }

  /// Returns a responsive font size scaled linearly based on the screen width
  /// relative to [_kReferenceScreenWidthForText].
  ///
  /// [fontSize]: The base font size to scale.
  /// Returns the calculated font size, rounded to [_kDefaultDecimalPlaces].
  double getResponsiveFontSize(double fontSize) {
    _checkInitialized();
    double scaleFactor = _screenWidth / _kReferenceScreenWidthForText;
    // Optional: Add min/max clamps for the scaleFactor if desired
    // e.g., scaleFactor = scaleFactor.clamp(0.8, 1.5);
    return _roundToDecimals(fontSize * scaleFactor, _kDefaultDecimalPlaces);
  }

  /// Returns a scaled text size. This is an alias for [getFullScreen].
  /// Consider using [getResponsiveFontSize] or the `.sp` extension for more standard font scaling.
  double getTextSize(
    double percentage,
  ) =>
      getFullScreen(percentage);

  /// Returns a dynamic scaled size based on a formula involving the sum of
  /// scaled screen width and height: `(percentage/100)^2 * (screenWidth + screenHeight)`.
  ///
  /// Note: The percentage is squared in this formula.
  /// Useful for sizes proportional to both screen dimensions.
  ///
  /// [percentage]: The percentage to use in the scaling formula.
  double getFullScreen(
    double percentage,
  ) {
    _checkInitialized();
    // With simplified getWidth/getHeight, this becomes:
    // (percentage / 100) * (screenWidth * p/100 + screenHeight * p/100)
    // = (percentage / 100)^2 * (screenWidth + screenHeight)
    return (percentage / 100) * (getHeight(percentage) + getWidth(percentage));
  }

  /// Returns [EdgeInsets] scaled by [height] and [width] percentages.
  /// L/R use `getWidth(width)`, T/B use `getHeight(height)`.
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

  /// Returns [EdgeInsets] with all sides scaled by [height] percentage.
  EdgeInsetsGeometry getPaddingByHeight(
    double height,
  ) =>
      EdgeInsets.all(getHeight(height));

  /// Returns [EdgeInsets] with all sides scaled by [width] percentage.
  EdgeInsetsGeometry getPaddingByWidth(
    double width,
  ) =>
      EdgeInsets.all(getWidth(width));

  /// Returns [EdgeInsets] with L/T/R/B paddings scaled by respective percentages.
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

  /// Returns [EdgeInsets] with all sides scaled using [getFullScreen] logic.
  EdgeInsetsGeometry getPaddingAll(double all) =>
      EdgeInsets.all(getFullScreen(all));

  /// Returns [EdgeInsets] for margins, scaled by [height] and [width] percentages.
  /// L/R use `getWidth(width)`, T/B use `getHeight(height)`.
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

  /// Returns [EdgeInsets] for margins with all sides scaled by [height] percentage.
  EdgeInsetsGeometry getMarginByHeight(
    double height,
  ) =>
      EdgeInsets.all(getHeight(height));

  /// Returns [EdgeInsets] for margins with all sides scaled by [width] percentage.
  EdgeInsetsGeometry getMarginByWidth(
    double width,
  ) =>
      EdgeInsets.all(getWidth(width));

  /// Returns [EdgeInsets] for margins with L/T/R/B scaled by respective percentages.
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

  /// Returns [EdgeInsets] for margins with all sides scaled using [getFullScreen] logic.
  EdgeInsetsGeometry getMarginAll(
    double percentage,
  ) =>
      EdgeInsets.all(getFullScreen(percentage));

  /// Returns [BorderRadius] with circular radius scaled using [getFullScreen] logic.
  BorderRadius getBorderRadiusCircular(
    double radius,
  ) =>
      BorderRadius.circular(getFullScreen(radius));

  /// Returns [BorderRadius] with individually scaled corners using [getFullScreen] logic.
  BorderRadius getBorderRadiusCircularLR(
    double topLeft,
    double topRight,
    double bottomLeft,
    double bottomRight,
  ) =>
      BorderRadius.only(
        topLeft: Radius.circular(getFullScreen(topLeft)),
        topRight: Radius.circular(getFullScreen(topRight)),
        bottomLeft: Radius.circular(getFullScreen(bottomLeft)),
        bottomRight: Radius.circular(getFullScreen(bottomRight)),
      );

  /// Returns [BorderRadius] with circular radius scaled by [getHeight].
  BorderRadius getBorderRadiusCircularByHeight(
    double radius,
  ) =>
      BorderRadius.circular(
        getHeight(radius),
      );

  /// Returns [BorderRadius] with circular radius scaled by [getWidth].
  BorderRadius getBorderRadiusCircularByWidth(
    double radius,
  ) =>
      BorderRadius.circular(
        getWidth(radius),
      );
}

// --- Extension Methods ---
extension ScreenScalerExtensions on num {
  /// Returns a height equivalent to this [num] value as a percentage of the screen height.
  /// ScreenScaler must be initialized using `ScreenScaler.init(context)` before using this.
  double get h => ScreenScaler.I.getHeight(toDouble());

  /// Returns a width equivalent to this [num] value as a percentage of the screen width.
  /// ScreenScaler must be initialized using `ScreenScaler.init(context)` before using this.
  double get w => ScreenScaler.I.getWidth(toDouble());

  /// Returns a font size scaled linearly based on screen width.
  /// ScreenScaler must be initialized using `ScreenScaler.init(context)` before using this.
  /// See [ScreenScaler.getResponsiveFontSize].
  double get sp => ScreenScaler.I.getResponsiveFontSize(toDouble());
}
