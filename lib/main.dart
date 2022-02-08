import 'package:flutter/material.dart';
import 'package:fortune_wheel_game/spinwheelscreen.dart';

//THƯ VIỆN TƯƠNG TỰ: https://pub.dev/packages/flutter_spinning_wheel
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortune Wheel Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpinWheel(),
    );
  }
}
