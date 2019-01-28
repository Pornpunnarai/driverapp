import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 15.0, top: 40.0, right: 15.0),
        alignment: Alignment.center,
        color: Colors.blueGrey,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  'MacdoNal',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontFamily: 'Sarabun',
                      fontWeight: FontWeight.w300,
                      fontSize: 30.0,
                      fontStyle: FontStyle.italic),
                )),
                Expanded(
                  child: Text(
                    'Bakery Nana Gunger',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontFamily: 'Sarabun',
                        fontWeight: FontWeight.w300,
                        fontSize: 25.0,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  'หกดาสหกวาหวสห่ืสา',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontFamily: 'Sarabun',
                      fontWeight: FontWeight.w300,
                      fontSize: 30.0,
                      fontStyle: FontStyle.italic),
                )),
                Expanded(
                  child: Text(
                    'ห่ืสห่ืไดวหาวส่',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontFamily: 'Sarabun',
                        fontWeight: FontWeight.w300,
                        fontSize: 25.0,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            ImageAsset(),
            Button(),
          ],
        ),
      ),
    );
  }
}

class ImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/car-icon-red.png');
    Image image = Image(
      image: assetImage,
      width: 100.0,
    );
    return Container(
      child: image,
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: 200.0,
      height: 40.0,
      child: RaisedButton(
          color: Colors.green,
          child: Text(
            'Accept',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: 'Sarabun',
                fontWeight: FontWeight.w700),
          ),
          elevation: 6.0,
          onPressed: () => statusChange(context)),
    );
  }

  void statusChange(BuildContext context){
    var alearDialog = AlertDialog(
      title: Text('Avaliable'),
      content: Text('still working'),
    );

    showDialog(
        context:context,
        builder: (BuildContext context) => alearDialog

    );
  }
}
