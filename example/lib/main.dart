import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Screen Scaler Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);

    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // to prevent overlapping with the status bar
            Container(
              alignment: Alignment.center,
              color: Colors.white,
              // take 50% of the height
              height: scaler.getHeight(50),
              // take 100% of the width
              width: scaler.getWidth(100),
              child: Text(
                "Height:50%\nWidth:100%\nFont Size:15%",
                style: TextStyle(
                  fontSize: scaler.getTextSize(15),
                ),
              ),
            ),
            Row(
              children: <Widget> [
                Container(
                  alignment: Alignment.center,
                  color: Colors.green,
                  // take 25% of the height
                  height: scaler.getHeight(50),
                  // take 50% of the width
                  width: scaler.getWidth(50),
                  child: Text(
                    "Height:50%\nWidth:50%\nFont Size:14%",
                    style: TextStyle(
                    fontSize: scaler.getTextSize(14),
                    ),
                  ),
                ), 
                Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  // take 25% of the height
                  height: scaler.getHeight(25),
                  // take 25% of the width
                  width: scaler.getWidth(25),
                  child: Text(
                    "Height:25%\nWidth:25%\nFont Size:10%",
                    style: TextStyle(
                    fontSize: scaler.getTextSize(10),
                    ),
                  ),
                ), 
                Container(
                  alignment: Alignment.center,
                  color: Colors.red,
                  // take 12.5% of the height
                  height: scaler.getHeight(12.5),
                  // take 12.5% of the width
                  width: scaler.getWidth(12.5),
                  child: Text(
                    "Height:12.5%\nWidth:12.5%\nFont Size:8%",
                    style: TextStyle(
                    fontSize: scaler.getTextSize(8),
                    ),
                  ),
                ), 
                Container(
                  alignment: Alignment.center,
                  color: Colors.orange,
                  // take 50% of the height
                  height: scaler.getHeight(50),
                  // take 12.5% of the width
                  width: scaler.getWidth(12.5),
                  child: Text(
                    "Height:50%\nWidth:12.5%\nFont Size:8%",
                    style: TextStyle(
                    fontSize: scaler.getTextSize(8),
                    ),
                  ),
                ), 
            ])
          ],
        ),
      ),
    );
  }
}