import 'package:flutter/material.dart';


class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  bool _value = false;
  final _open = 'พร้อมรับงาน';
  final _close = 'ไม่พร้อมรับงาน';

  void _onChanged(bool value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    assert (debugCheckHasMediaQuery(context));
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Switch(
                  value: _value,
                  onChanged: _onChanged,
                  activeColor: Colors.green,
                ),
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Container(
              height: 40.0,
              alignment: Alignment.center,
              child: Text(_open,
                  style: TextStyle(fontSize: 20.0, color: Colors.green)),
            ),
          ),
        ),
      ),
      body: Container(
        child: new Center(
          child: new Text('Google Map Page', style : TextStyle(fontSize: 40.0, color: Colors.green)),
        ),
      ),
    );
  }
}
