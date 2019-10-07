import 'package:flutter/material.dart';
import '../lib/flutter_screen_scaler.dart';

void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen ScreenScaler Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  ExamplePage({Key key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler()..init(context);

    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Column(
          children: <Widget>[
            // to prevent overlapping with the status bar
            Container(height: 30),
            Container(
              alignment: Alignment.center,
              color: Colors.white,
              // take 50% of the height
              height: ScreenScaler.getHeight(50),
              // take 50% of the height
              width: ScreenScaler.getWidth(90),
              child: Text(
                "Height:50%\nWidth:90%\nFont Size:15%",
                style: TextStyle(
                  fontSize: ScreenScaler.getTextSize(15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
