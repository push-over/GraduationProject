import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:convert';
import 'goods_list.dart';
import '../../service/service_method.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();
  List<Map> goodsDataList = [];
  int page = 1;

  void _getGoods() {
    var formPage = {'page': page};
    request('homePageBelowConten', formData: formPage).then((val) {
      var data = json.decode(val.toString());
      List<Map> newGoodsList = (data['data'] as List).cast();
      setState(() {
        goodsDataList.addAll(newGoodsList);
        page++;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getGoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('极速购'),
        ),
        body: EasyRefresh(
          refreshHeader: ClassicsHeader(
            key: _headerKey,
            bgColor: Colors.white,
            textColor: Colors.black,
            moreInfoColor: Colors.black,
          ),
          refreshFooter: ClassicsFooter(
            key: _footerKey,
            bgColor: Colors.white,
            textColor: Colors.black,
            moreInfoColor: Colors.black,
          ),
          child: ListView(
            children: <Widget>[
              GoodsList(goodsDataList: goodsDataList),
            ],
          ),
          onRefresh: () async {},
          loadMore: () async {},
        ));
  }
}
