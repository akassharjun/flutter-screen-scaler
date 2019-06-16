# flutter_screen_scaler

A package to resize your widgets according to the screen size with the use of percentages.

## Usage:

### Depend on it

```
dependencies:
  flutter:
    sdk: flutter
  // append the line below to your dependancy list
  flutter_screen_scaler: ^0.0.1
```

### Import it into your Dart file

```
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
```

### Use it!

```
Widget build(BuildContext context) {
  ScreenScaler scaler = new ScreenScaler..init(context);

  return Container(
    // take up 50% of the screen's width.
    width: scaler.getWidth(50),
    // take up 25% of the screen's height.
    height: scaler.getHeight(25),
    // the text size is calculated using the height and the width
    child : Text("Hello There!",
      style : TextStyle(
        fontSize : scaler.getTextSize(20)
      ),
    ),
  );
}
```
