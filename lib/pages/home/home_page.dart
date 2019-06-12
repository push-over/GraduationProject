import 'package:flutter/material.dart';
import 'dart:convert';
import '../../components/swiper_widget.dart';
import '../../service/service_method.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      appBar: AppBar(
        title: Text('flutter 汉德森'),
      ),
      body: FutureBuilder(
        future: getHomePageContext(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            List<Map> swiperDataList = (data['data']['slides'] as List).cast();
            return Column(
              children: <Widget>[
                SwiperDiy(swiperDataList: swiperDataList),
              ],
            );
          } else {
            return Center(
              child: Text('加载中。。。'),
            );
          }
        },
      ),
    );
  }
}
