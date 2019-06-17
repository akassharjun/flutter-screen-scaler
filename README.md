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

![screenshot](https://github.com/akassharjun/flutter-screen-scaler/blob/master/assets/sample_image.png?raw=true)

You can see that with the use of percentages it's much easier to create responsive applications.

### Why

Imagine you have a phone with a big screen size, you develop an application using a bunch of Containers for your main page. You use hardcoded values for the height & width of the Container (Let's say 500 for the height) You run it and awesome, it fits your phone and works well! But try running it on an iPhone 5s, you are gonna be bombarded with error messages and those screen overflow warnings. You could solve this by using a SingleScrollChildView Widget but what if it affected the UI/UX design your application? That's why I wrote Flutter Screen Scalar. You give it the percentage you want a Container to take up, it will give you the height for that specific screen size.
