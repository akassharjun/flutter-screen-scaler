import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

void main() {
  test('returns the height equivalent of the percentage provided', () {
    final screenScaler = ScreenScaler();

    /// first test case result
    double first = 10 / 100 * 1920;

    /// second test case result
    double second = 50 / 100 * 1920;

    expect(screenScaler.getHeight(10), first);
    expect(screenScaler.getHeight(50), second);

    expect(() => screenScaler.getHeight(null), throwsNoSuchMethodError);
  });

  test('returns the width equivalent for the percentage provided', () {
    final screenScaler = ScreenScaler();

    /// first test case result
    double first = 5 / 100 * 1080;

    /// second test case result
    double second = 45 / 100 * 1080;

    expect(screenScaler.getWidth(5), first);
    expect(screenScaler.getWidth(45), second);

    expect(() => screenScaler.getWidth(null), throwsNoSuchMethodError);
  });
  test('returns the text size for the percentage provided', () {
    final screenScaler = ScreenScaler();

    /// first test case result
    double first =
        15 / 100 * (screenScaler.getHeight(15) + screenScaler.getWidth(15));

    /// second test case result
    double second =
        25 / 100 * (screenScaler.getHeight(25) + screenScaler.getWidth(25));

    expect(screenScaler.getTextSize(15), first);
    expect(screenScaler.getTextSize(25), second);

    expect(() => screenScaler.getTextSize(null), throwsNoSuchMethodError);
  });
}
