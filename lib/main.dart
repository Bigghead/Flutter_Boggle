import 'package:flutter/material.dart';

import './Screens/HomeScreen/home_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': ( BuildContext context ) => HomeScreen()
      },
    );
  }
}

