import 'package:flutter/material.dart';
import 'package:driverapp/services/authentication.dart';
import 'package:driverapp/app_screens/first_screen.dart' as first;
import 'package:driverapp/app_screens/second_screen.dart' as second;
import 'package:driverapp/app_screens/third_screen.dart' as third;
import 'package:driverapp/app_screens/job.dart' as job;


class HomeScreen extends StatefulWidget {

  HomeScreen({Key key, this.auth, this.userId, this.onSignedOut, this.currentLocation, this.onChangeStatus, this.status})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  final Map<String, double> currentLocation;
  final VoidCallback onChangeStatus;
  final bool status;

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final int _pageCount = 4;
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
            currentLocation: widget.currentLocation,
            onChangeStatus: widget.onChangeStatus,
            status: widget.status
        );
      case 1:
        return second.Second();
      case 2:
        return third.Third(
            userId: widget.userId,
            auth: widget.auth,
            onSignedOut: widget.onSignedOut
        );

      case 3:
        return job.Jobpage();
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
        BottomNavigationBarItem(
          icon: Icon(
            Icons.directions_car,
            color: Colors.black,
          ),
          title: Text("Test", style: bottomNavigationBarItemStyle),
        ),
      ],
      onTap: (int index) {
        setState(() {
          _pageIndex = index;
        });
      },
    );
  }


}