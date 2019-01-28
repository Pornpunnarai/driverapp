import 'package:flutter/material.dart';
import 'package:driverapp/app_screens/loginpage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driver Login App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}



