import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

void main() {
  test('returns the height equivalent of the percentage provided', () {
    /// first test case result
    double first = 10 / 100 * 1920;

    /// second test case result
    double second = 50 / 100 * 1920;

    expect(ScreenScaler.getHeight(10), first);
    expect(ScreenScaler.getHeight(50), second);

    expect(() => ScreenScaler.getHeight(null), throwsFlutterError);
  });

  test('returns the width equivalent for the percentage provided', () {
    /// first test case result
    double first = 5 / 100 * 1080;

    /// second test case result
    double second = 45 / 100 * 1080;

    expect(ScreenScaler.getWidth(5), first);
    expect(ScreenScaler.getWidth(45), second);

    expect(() => ScreenScaler.getWidth(null), throwsFlutterError);
  });
  test('returns the text size for the percentage provided', () {
    /// first test case result
    double first =
        15 / 100 * (ScreenScaler.getHeight(15) + ScreenScaler.getWidth(15));

    /// second test case result
    double second =
        25 / 100 * (ScreenScaler.getHeight(25) + ScreenScaler.getWidth(25));

    expect(ScreenScaler.getTextSize(15), first);
    expect(ScreenScaler.getTextSize(25), second);

    expect(() => ScreenScaler.getTextSize(null), throwsFlutterError);
  });
}

