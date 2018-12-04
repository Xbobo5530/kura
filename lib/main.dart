import 'package:flutter/material.dart';
import 'package:kura/src/pages/home.dart';
import 'package:kura/src/utils/consts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: COLOR_PRIMARY,
      ),
      home: MyHomePage(),
    );
  }
}
