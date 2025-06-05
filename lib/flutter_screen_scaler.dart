library flutter_screen_scaler;

import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

/// A utility class to scale widget dimensions and font sizes based on screen percentages.
///
/// Widgets can be sized relative to the screen width, screen height, or an average
/// of both, using percentages. This allows for responsive UIs that adapt to
/// different screen sizes.
///
/// To use, instantiate `ScreenScaler` with the current `BuildContext`:
/// ```dart
/// ScreenScaler scaler = ScreenScaler(context);
/// double width = scaler.getWidth(50); // 50% of screen width
/// double textSize = scaler.getTextSize(3); // 3% of screen width for text
/// ```
class ScreenScaler {
  final double _screenWidth;
  final double _screenHeight;

  /// Initializes the scaler with screen dimensions from the provided [BuildContext].
  ///
  /// This captures the screen width and height, which are then used for all
  /// percentage-based calculations.
  ScreenScaler(BuildContext context)
      : _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;

  /// Returns a width value scaled by the given [percentage] of the screen width.
  ///
  /// For example, a [percentage] of 50 will return half of the screen width.
  /// [percentage] is a non-nullable double.
  double getWidth(double percentage) {
    return _screenWidth * percentage / 100;
  }

  /// Returns a height value scaled by the given [percentage] of the screen height.
  ///
  /// For example, a [percentage] of 50 will return half of the screen height.
  /// [percentage] is a non-nullable double.
  double getHeight(double percentage) {
    return _screenHeight * percentage / 100;
  }

  /// Returns a text size scaled by the given [percentage] of the screen width.
  ///
  /// This is typically used for font sizes. For example, a [percentage] of 3
  /// might return a suitable font size relative to the screen width.
  /// [percentage] is a non-nullable double.
  double getTextSize(
    double percentage,
  ) =>
      percentage / 100 * _screenWidth;

  /// Returns a dimension scaled by the given [percentage] of the average of the
  /// screen width and height.
  ///
  /// This can be useful for creating sizes that are proportional to the overall
  /// screen size, rather than strictly to its width or height.
  /// [percentage] is a non-nullable double.
  double getScaledDimension(
    double percentage,
  ) =>
      (_screenWidth + _screenHeight) / 2 * (percentage / 100);

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

  /// Returns an [EdgeInsetsGeometry] with all sides set to a value scaled by
  /// [all] percentage using [getScaledDimension].
  EdgeInsetsGeometry getPaddingAll(double all) =>
      EdgeInsets.all(getScaledDimension(all));

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

  /// Returns an [EdgeInsetsGeometry] with all sides set to a value scaled by
  /// [percentage] using [getScaledDimension].
  EdgeInsetsGeometry getMarginAll(
    double percentage,
  ) =>
      EdgeInsets.all(getScaledDimension(percentage));

  /// Returns a [BorderRadius] with a circular radius scaled by [radius]
  /// percentage using [getScaledDimension].
  BorderRadius getBorderRadiusCircular(
    double radius,
  ) =>
      BorderRadius.circular(getScaledDimension(radius));

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
        getWidth(radius),
      );
}
