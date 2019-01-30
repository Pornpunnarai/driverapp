import 'package:flutter/material.dart';

class Third extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Container(
          padding: EdgeInsets.only(top: 15.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text('เพิ่มเติม', style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: new Center(
          child: new Text('More', style : TextStyle(fontSize: 40.0, color: Colors.green)),
        ),
      ),
    );
  }
}