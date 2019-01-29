import 'package:flutter/material.dart';
import 'package:driverapp/app_screens/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driver Login App',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomeScreen2(),
      debugShowCheckedModeBanner: false,
    );
  }
}