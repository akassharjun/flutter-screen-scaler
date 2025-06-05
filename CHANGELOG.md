# Changelog

## [3.0.0] - YYYY-MM-DD

### Breaking Changes
- **Refactored `ScreenScaler` to use a singleton pattern.**
  - Access the instance via `ScreenScaler.I`.
  - Initialization is now done via a static method: `ScreenScaler.init(context)`.
  - The constructor `ScreenScaler()` is no longer public; direct instantiation is replaced by the singleton.
- **Simplified Core Scaling Logic for `getWidth` and `getHeight`**.
  - These methods now consistently return a direct percentage of the screen width/height.
  - The previous complex scaling logic based on `_fixedWidth` and `_fixedHeight` (which involved `log` and screen ratio adjustments) has been removed to ensure straightforward percentage scaling.
  - The constants `_fixedWidth` and `_fixedHeight` have been removed as they are no longer used by the primary scaling methods.
- **Removed Nullable Parameters.**
  - Methods like `getWidth(double? percentage)`, `getHeight(double? percentage)`, and `getTextSize(double? percentage)` now require non-nullable `double` parameters.

### Added
- **Extension Methods for Concise Scaling.**
  - Added extension methods on `num` for convenient scaling (after `ScreenScaler.init(context)` has been called):
    - `.h`: Scales the number as a percentage of the screen height (e.g., `50.h`).
    - `.w`: Scales the number as a percentage of the screen width (e.g., `30.w`).
    - `.sp`: Scales the number as a responsive font size, linearly based on screen width relative to a reference width (e.g., `16.sp`).
- **New Responsive Font Scaling Method.**
  - Added `ScreenScaler.I.getResponsiveFontSize(double fontSize)` for linear font scaling. This is used by the `.sp` extension.
  - A reference screen width (`_kReferenceScreenWidthForText`) is used for this scaling.
- **Parent-Relative Scaling Methods.**
  - Added `ScreenScaler.I.scaleWidthFrom(Size parentSize, double percentage)` to scale based on a percentage of the parent widget's width.
  - Added `ScreenScaler.I.scaleHeightFrom(Size parentSize, double percentage)` to scale based on a percentage of the parent widget's height.

### Changed
- **Improved Documentation.**
  - Updated all Dartdoc comments for clarity, conciseness, and to reflect the new API and scaling logic.
  - Clarified the behavior of `getTextSize` (and its alias `getFullScreen`), noting its quadratic scaling behavior due to its formula.
- **Code Quality.**
  - Improved variable naming and use of `final` for local variables.
  - Introduced `_kDefaultDecimalPlaces` constant for rounding precision.
  - Added a debug warning if screen-dependent scaling methods are called before `ScreenScaler.init(context)`.

### Updated
- **Example App.**
  - The example in `example/lib/main.dart` has been updated to demonstrate the new singleton initialization, extension methods (`.h`, `.w`, `.sp`), and API usage.
- **Unit Tests.**
  - Tests in `test/flutter_screen_scaler_test.dart` have been updated to reflect all API changes, cover new extension methods, and test new functionalities like parent-relative scaling and responsive font scaling. Invalid null-check tests were removed due to non-nullable parameters.

## [1.0.0] - 17/06/2019

* Added support for getting the width dynamically using percentages.
* Added support for getting the height dynamically using percentages.
* Added support for getting the text size dynamically using percentages.

## [2.0.0] - 08/10/2019

* Completely rewrote the screen scaling methods.
* Added support for getting the padding dynamically using percentages.
* Added support for getting the margin dynamically using percentages.
* Added support for getting the a size dynamically using percentages.

## [2.1.0] - 18/12/2021

* Null Safety
