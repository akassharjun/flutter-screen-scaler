# flutter_screen_scaler

A package to resize your widgets according to the screen size with the use of percentages.

## Usage:

### Depend on it

```yaml
dependencies:
  flutter:
    sdk: flutter
  // append the line below to your dependancy list
  flutter_screen_scaler: ^0.0.1
```

### Import it into your Dart file

```dart
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
```

### Use it!

```dart
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

### Screenshots

![screenshot](https://github.com/akassharjun/flutter-screen-scaler/blob/master/assets/sample_image_with_container.png?raw=true)

You can see that with the use of percentages it's much easier to create responsive applications.

Sample application will be linked soon.

### Why?

Imagine you have a phone with a big screen size (I own a OnePlus 6, quite big). You develop a flutter application using a bunch of Cards, Container and what not. Sometimes you'll find yourself giving them heights and widths, you try different heights to fit the perfect match for your phone. Great! Now try running this Flutter application on an iPhone 5s, you be bombarded with a ton of error messages and Screen Overflow warnings on your phone. This is where Flutter Screen Scaler comes into play, it will resize all your widgets according to the percentage you provide and the phone's screen dimension. It's pretty much just like using percentages in HTML.
