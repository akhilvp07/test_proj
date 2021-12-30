import 'package:flutter/material.dart';
import 'package:test_proj/screen_one.dart';
import 'package:test_proj/screen_two.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ScreenOne(),
      routes: {
        'screen1': (ctx) {
          return ScreenOne();
        },
        'screen2': (ctx) {
          return ScreenTwo();
        },
      },
    );
  }
}
