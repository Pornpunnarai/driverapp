import 'package:flutter/material.dart';
import 'package:driverapp/services/authentication.dart';
import 'package:driverapp/app_screens/first_screen.dart' as first;
import 'package:driverapp/app_screens/second_screen.dart' as second;
import 'package:driverapp/app_screens/third_screen.dart' as third;


class HomeScreen extends StatefulWidget {

  HomeScreen({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;


  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final int _pageCount = 3;
  int _pageIndex = 0;

  final List<BottomNavigationBarItem> bottomBarItems =[];
  final bottomNavigationBarItemStyle = TextStyle(fontSize:17.0, fontStyle: FontStyle.normal, color:Colors.black);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _body() {
    return Container(
      child: Stack(
        children: List<Widget>.generate(_pageCount, (int index) {
          return IgnorePointer(
            ignoring: index != _pageIndex,
            child: Opacity(
              opacity: _pageIndex == index ? 1.0 : 0.0,
              child: Navigator(
                onGenerateRoute: (RouteSettings settings) {
                  return new MaterialPageRoute(
                    builder: (_) => _page(index),
                    settings: settings,
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _page(int index) {
    switch (index) {
      case 0:
        return first.First(
            userId: widget.userId,
            auth: widget.auth,
            onSignedOut: widget.onSignedOut
        );
      case 1:
        return second.Second();
      case 2:
        return third.Third(
            userId: widget.userId,
            auth: widget.auth,
            onSignedOut: widget.onSignedOut
        );
    }

    throw "Invalid index $index";
  }

  BottomNavigationBar _bottomNavigationBar() {
//    final theme = Theme.of(context);
    return new BottomNavigationBar(
//      fixedColor: theme.accentColor,
      currentIndex: _pageIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: Text("หน้าแรก", style: bottomNavigationBarItemStyle),
        ),
        BottomNavigationBarItem(
    icon: Icon(
          Icons.account_circle,
          color: Colors.black,
        ),
        title: Text("ข้อมูลส่วนตัว", style: bottomNavigationBarItemStyle),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history,
            color: Colors.black,
          ),
          title: Text("ประวัติ", style: bottomNavigationBarItemStyle),
        ),
      ],
      onTap: (int index) {
        setState(() {
          _pageIndex = index;
        });
      },
    );
  }


//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      bottomNavigationBar: CustomBottomBar( userId: widget.userId,
//          auth: widget.auth,
//          onSignedOut: widget.onSignedOut),
//    );
//    first.First(
//                  userId: widget.userId,
//                  auth: widget.auth,
//                  onSignedOut: widget.onSignedOut
//              );
//    return Material(
//        child: Scaffold(
//            bottomNavigationBar: new Material(
//                color: Colors.redAccent,
//                child:
//                new TabBar(controller: controller, tabs: <Tab>[
//                  new Tab(
//                    icon: new Icon(Icons.home),
//                    text: 'หน้าแรก',
//                  ),
//                  new Tab(
//                    icon: new Icon(Icons.account_circle),
//                    text: 'ข้อมูลส่วนตัว',
//                  ),
//                  new Tab(
//                    icon: new Icon(Icons.history),
//                    text: 'ประวัติ',
//                  ),
//                ],
//                    indicatorColor: Colors.white,
//                    labelColor:Colors.black,
//                    labelStyle:TextStyle(fontSize: 17.0),
//                    unselectedLabelColor:Colors.white)),
//            body: new TabBarView(controller: controller, children: <Widget>[
//              new first.First(
//                  userId: widget.userId,
//                  auth: widget.auth,
//                  onSignedOut: widget.onSignedOut
//              ),
//              new third.Third(
//                  userId: widget.userId,
//                  auth: widget.auth,
//                  onSignedOut: widget.onSignedOut
//              ),
//              new second.Second(),
////              new third.Third(),
//
//            ]))
//    );




//  }
}