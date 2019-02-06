import 'package:flutter/material.dart';
import 'package:driverapp/main.dart';

class CustomBottomBar extends StatelessWidget {

  final List<BottomNavigationBarItem> bottomBarItems =[];
  final bottomNavigationBarItemStyle = TextStyle(fontSize:17.0, fontStyle: FontStyle.normal, color:Colors.black);

  CustomBottomBar(){
    bottomBarItems.add(
      BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          color: appTheme.primaryColor,
        ),
          icon: Icon(
            Icons.home,
            color: Colors.black,
          ),
        title: Text("หน้าแรก", style: bottomNavigationBarItemStyle),
      ),
    );

    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.account_circle,
          color: Colors.black,
        ),
        title: Text("ข้อมูลส่วนตัว", style: bottomNavigationBarItemStyle),
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.history,
          color: Colors.black,
        ),
        title: Text("ประวัติ", style: bottomNavigationBarItemStyle),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
        items: bottomBarItems,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
