import 'package:flutter/material.dart';
import 'package:driverapp/app_screens/homepage.dart';

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


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}




class _LoginFormState extends State<LoginForm> {
  final _minimumPadding = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Driver Login'),
//        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            Logo(),
            Padding(
              padding: EdgeInsets.all(_minimumPadding),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_minimumPadding),
              child: TextField(
                  keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Login',
                      style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                  },

                )
              ],
            )
          ],
        ),
      ),
    );

  }
  Widget Logo(){
     return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Container(
          margin: EdgeInsets.all(_minimumPadding * 10),
          height: 100.0,
          width: 100.0,
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(50.0),
              color: Colors.red),
          child: new Icon(
            Icons.directions_bus,
            color: Colors.white,
            size: 80.0,
          ),
        ),
      ],
    );
  }
}

