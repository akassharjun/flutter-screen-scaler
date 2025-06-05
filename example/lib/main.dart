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
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler.init(context);

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
              height: 50.h,
              // take 100% of the width
              width: 100.w,
              child: Text(
                "Height:50%\nWidth:100%\nFont Size:15%",
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  color: Colors.green,
                  // take 50% of the height
                  height: 50.h,
                  // take 50% of the width
                  width: 50.w,
                  child: Text(
                    "Height:50%\nWidth:50%\nFont Size:14%",
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  // take 25% of the height
                  height: 25.h,
                  // take 25% of the width
                  width: 25.w,
                  child: Text(
                    "Height:25%\nWidth:25%\nFont Size:10%",
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.purple,
                      // take 12.5% of the height
                      height: 12.5.h,
                      // take 12.5% of the width
                      width: 12.5.w,
                      child: Text(
                        "Height:12.5%\nWidth:12.5%\nFont Size:8%",
                        style: TextStyle(
                          fontSize: 8.sp,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      // take 12.5% of the height
                      height: 12.5.h,
                      // take 12.5% of the width
                      width: 12.5.w,
                      child: Text(
                        "Height:12.5%\nWidth:12.5%\nFont Size:8%",
                        style: TextStyle(
                          fontSize: 8.sp,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.green,
                      // take 12.5% of the height
                      height: 12.5.h,
                      // take 12.5% of the width
                      width: 12.5.w,
                      child: Text(
                        "Height:12.5%\nWidth:12.5%\nFont Size:8%",
                        style: TextStyle(
                          fontSize: 8.sp,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      // take 12.5% of the height
                      height: 12.5.h,
                      // take 12.5% of the width
                      width: 12.5.w,
                      child: Text(
                        "Height:12.5%\nWidth:12.5%\nFont Size:8%",
                        style: TextStyle(
                          fontSize: 8.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.orange,
                      // take 25% of the height (corrected from 50% in comment)
                      height: 25.h,
                      // take 12.5% of the width
                      width: 12.5.w,
                      child: Text(
                        "Height:25%\nWidth:12.5%\nFont Size:8%",
                        style: TextStyle(
                          fontSize: 8.sp,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.pink,
                      // take 25% of the height (corrected from 50% in comment)
                      height: 25.h,
                      // take 12.5% of the width
                      width: 12.5.w,
                      child: Text(
                        "Height:25%\nWidth:12.5%\nFont Size:8%",
                        style: TextStyle(
                          fontSize: 8.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}