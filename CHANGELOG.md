## [3.0.0] - YYYY-MM-DD

### Changed
- **BREAKING:** Changed `ScreenScaler` initialization: removed `init()` method, now uses constructor `ScreenScaler(BuildContext context)`.
- **BREAKING:** Simplified scaling logic in `getWidth` and `getHeight` to be direct percentage calculations of screen dimensions. Removed previous complex scaling and internal fixed design sizes.
- **BREAKING:** Modified `getTextSize` to scale based on screen width percentage only, instead of a combination of scaled height and width.
- **BREAKING:** Renamed `getFullScreen()` to `getScaledDimension()` and changed its calculation to be based on the average of screen width and height.
- Improved null safety by making percentage parameters in core methods (`getWidth`, `getHeight`, `getTextSize`) non-nullable.
- Updated code comments and documentation for clarity across the library.

### Fixed
- Fixed bug in `getBorderRadiusCircularByWidth` where it incorrectly used `getHeight` instead of `getWidth`.

## [2.1.0] - 18/12/2021

* Null Safety

## [2.0.0] - 08/10/2019

* Completely rewrote the screen scaling methods.
* Added support for getting the padding dynamically using percentages.
* Added support for getting the margin dynamically using percentages.
* Added support for getting the a size dynamically using percentages.

## [1.0.0] - 17/06/2019

* Added support for getting the width dynamically using percentages.
* Added support for getting the height dynamically using percentages.
* Added support for getting the text size dynamically using percentages.
