import 'package:flutter/material.dart';
import 'home_page.dart';
import 'purchase_page.dart';
import 'cart_page.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.flash_on), title: Text('极速购')),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_outline), title: Text('个人中心'))
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    PurchasePage(),
    CartPage(),
    MemberPage()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: tabBodies[_currentIndex],
    );
  }
}
