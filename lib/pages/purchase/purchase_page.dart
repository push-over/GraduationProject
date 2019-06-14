import 'package:flutter/material.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('极速购'),
      ),
      body: Center(
        child: Text('极速购'),
      ),
    );
  }
}
