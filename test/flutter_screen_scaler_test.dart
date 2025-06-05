import 'dart:math'; // Added for pow function
import 'package:flutter/material.dart'; // Added for Size
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

void main() {
  // ScreenScaler will use its default dimensions (1080w, 1920h) as init() is not called with a context.
  // A debug warning about initialization will be printed by ScreenScaler, which is expected in this test setup.
  final scaler = ScreenScaler.I;

  // Default dimensions used by ScreenScaler if not initialized
  const double defaultScreenWidth = 1080.0;
  const double defaultScreenHeight = 1920.0;
  const int decimalPlaces = 5; // As per _kDefaultDecimalPlaces
  const double refTextWidth = 375.0; // As per _kReferenceScreenWidthForText

  // Helper to mimic the internal rounding for test comparisons
  double round(double val) {
    num mod = pow(10.0, decimalPlaces);
    return ((val * mod).round().toDouble() / mod);
  }

  group('Screen-based scaling (getWidth, getHeight, getTextSize)', () {
    test('getHeight returns the height equivalent of the percentage provided', () {
      double expectedFirst = round(defaultScreenHeight * (10 / 100.0));
      double expectedSecond = round(defaultScreenHeight * (50 / 100.0));

      expect(scaler.getHeight(10), expectedFirst);
      expect(scaler.getHeight(50), expectedSecond);
    });

    test('getWidth returns the width equivalent for the percentage provided', () {
      double expectedFirst = round(defaultScreenWidth * (5 / 100.0));
      double expectedSecond = round(defaultScreenWidth * (45 / 100.0));

      expect(scaler.getWidth(5), expectedFirst);
      expect(scaler.getWidth(45), expectedSecond);
    });

    test('getTextSize returns the size for the percentage provided (based on getFullScreen)', () {
      double h15 = scaler.getHeight(15);
      double w15 = scaler.getWidth(15);
      double expectedFirst = round((15 / 100.0) * (h15 + w15));

      double h25 = scaler.getHeight(25);
      double w25 = scaler.getWidth(25);
      double expectedSecond = round((25 / 100.0) * (h25 + w25));

      expect(scaler.getTextSize(15), expectedFirst);
      expect(scaler.getTextSize(25), expectedSecond);
    });
  });

  group('Extension methods (.h, .w, .sp)', () {
    test('.h extension returns correct scaled height', () {
      expect(10.0.h, scaler.getHeight(10.0));
      expect(50.0.h, scaler.getHeight(50.0));
    });

    test('.w extension returns correct scaled width', () {
      expect(5.0.w, scaler.getWidth(5.0));
      expect(45.0.w, scaler.getWidth(45.0));
    });

    test('.sp extension returns correct responsive font size', () {
      expect(16.0.sp, scaler.getResponsiveFontSize(16.0));
      expect(24.0.sp, scaler.getResponsiveFontSize(24.0));
    });
  });

  group('Responsive font size (getResponsiveFontSize)', () {
    test('getResponsiveFontSize calculates correctly', () {
      double baseSize = 16.0;
      double expectedSize = round(baseSize * (defaultScreenWidth / refTextWidth));
      expect(scaler.getResponsiveFontSize(baseSize), expectedSize);

      baseSize = 24.0;
      expectedSize = round(baseSize * (defaultScreenWidth / refTextWidth));
      expect(scaler.getResponsiveFontSize(baseSize), expectedSize);
    });
  });

  group('Parent-based scaling (scaleWidthFrom, scaleHeightFrom)', () {
    const Size parentSize = Size(200, 300);

    test('scaleWidthFrom returns correct scaled width from parent', () {
      double expectedFirst = round(parentSize.width * (10 / 100.0));
      double expectedSecond = round(parentSize.width * (50 / 100.0));

      expect(scaler.scaleWidthFrom(parentSize, 10), expectedFirst);
      expect(scaler.scaleWidthFrom(parentSize, 50), expectedSecond);
    });

    test('scaleHeightFrom returns correct scaled height from parent', () {
      double expectedFirst = round(parentSize.height * (25 / 100.0));
      double expectedSecond = round(parentSize.height * (75 / 100.0));

      expect(scaler.scaleHeightFrom(parentSize, 25), expectedFirst);
      expect(scaler.scaleHeightFrom(parentSize, 75), expectedSecond);
    });
  });
}
