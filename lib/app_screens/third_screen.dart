import 'package:flutter/material.dart';

class Third extends StatelessWidget {

  void logout() {

  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Container(
          padding: EdgeInsets.only(top: 15.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text('ประวัติส่วนตัว', style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0),border: Border.all(color: Colors.red)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex:1,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.account_circle, size: 50.0,),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: <Widget>[
                       Text('Pawnpunnarai Saimoonkham', style: TextStyle(fontSize: 16.0),),
//                 Text('+66 824960172')
                      ],
                    ),
                  ),
                ],

              ),
            ),
            Container(
              child: Column(
                  children: <Widget>[
                    new Align(alignment: FractionalOffset.bottomCenter),
                    new RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: logout,
                      child: new Text("Logout", style: TextStyle(fontSize: 18.0),),
                    ),
                  ],
              ),
            ),
     
          ],
        ),

        ),
    );
  }
}
