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
      color: Colors.amber,
      child: Column(
        children: <Widget>[
          // to prevent overlapping with the status bar
          Container(height: 30),
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            // take 50% of the height
            height: scaler.getHeight(50),
            // take 50% of the height
            width: scaler.getWidth(90),
            child: Text(
              "Height:50%\nWidth:90%\nFont Size:15%",
              style: TextStyle(
                fontSize: scaler.getTextSize(15),
            ),
          ),
        )
      ],
    ),
  );
}
```

You can find the whole code at example/example.dart

### Screenshots

![screenshot](https://github.com/akassharjun/flutter-screen-scaler/blob/master/assets/sample_image_with_container.png?raw=true)

You can see that with the use of percentages it's much easier to create responsive applications.

Sample application will be linked soon.

### Why?

Imagine you have a phone with a big screen size (I own a OnePlus 6, quite big). You develop a flutter application using a bunch of Cards, Container and what not. Sometimes you'll find yourself giving them heights and widths, you try different heights to fit the perfect match for your phone. Great! Now try running this Flutter application on an iPhone 5s, you be bombarded with a ton of error messages and Screen Overflow warnings on your phone. This is where Flutter Screen Scaler comes into play! It will resize all your widgets according to the percentage you provide and the phone's screen dimension. It's pretty much just like using percentages in HTML.
