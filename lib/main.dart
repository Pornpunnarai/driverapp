import 'package:flutter/material.dart';
import 'package:driverapp/services/authentication.dart';
import 'package:driverapp/app_screens/root_page.dart';
import 'package:driverapp/app_screens/job.dart';

void main() => runApp(new MyApp());


Color firstColor = Color(0xFFD84315);
Color secondColor = Colors.white;
ThemeData appTheme = ThemeData(primaryColor: Color(0xFFD84315));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: new MediaQueryData(),
      child: MaterialApp(
        title: 'Driver Chiang-Mai App',
        theme: appTheme,
      home: new RootPage(auth: new Auth()),
//      home:  HomeScreen(),
//          home: Jobpage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
