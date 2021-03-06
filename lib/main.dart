import 'package:flutter/material.dart';
import 'package:sl_course_search/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomeScreen(),
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
    );
  }
}

