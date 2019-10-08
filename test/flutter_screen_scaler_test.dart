import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

void main() {
  test('returns the height equivalent of the percentage provided', () {
    ScreenScaler scaler = ScreenScaler();

    /// first test case result
    double first = 10 / 100 * 1920;

    /// second test case result
    double second = 50 / 100 * 1920;

    expect(scaler.getHeight(10), first);
    expect(scaler.getHeight(50), second);

    expect(() => scaler.getHeight(null), throwsFlutterError);
  });

  test('returns the width equivalent for the percentage provided', () {
    ScreenScaler scaler = ScreenScaler();

    /// first test case result
    double first = 5 / 100 * 1080;

    /// second test case result
    double second = 45 / 100 * 1080;

    expect(scaler.getWidth(5), first);
    expect(scaler.getWidth(45), second);

    expect(() => scaler.getWidth(null), throwsFlutterError);
  });
  test('returns the text size for the percentage provided', () {
    ScreenScaler scaler = ScreenScaler();

    /// first test case result
    double first = 15 / 100 * (scaler.getHeight(15) + scaler.getWidth(15));

    /// second test case result
    double second = 25 / 100 * (scaler.getHeight(25) + scaler.getWidth(25));

    expect(scaler.getTextSize(15), first);
    expect(scaler.getTextSize(25), second);

    expect(() => scaler.getTextSize(null), throwsFlutterError);
  });
}
