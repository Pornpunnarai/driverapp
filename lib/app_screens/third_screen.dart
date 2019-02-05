import 'package:flutter/material.dart';
import 'package:driverapp/services/authentication.dart';

class Third extends StatefulWidget {
  Third({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;


  @override
  State<StatefulWidget> createState() => new _ThirdState();


}

class _ThirdState extends State<Third> {

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      body: new ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.red)
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Icon(Icons.account_circle, size: 150.0,),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Pawnpunnarai Saimoonkham', style: TextStyle(fontSize: 22.0),),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('+66 824960172', style: TextStyle(fontSize: 18.0),),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child:
                                  Text('งน7821 ชม', style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w700),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        new RaisedButton(
                          padding: const EdgeInsets.all(8.0),
                          textColor: Colors.white,
                          color: Colors.blue,
                          onPressed: _signOut,
                          child: new Text("Logout", style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w700),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

