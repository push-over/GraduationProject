import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsList extends StatefulWidget {
  List<Map> goodsDataList = [];
  GoodsList({Key key, @required this.goodsDataList}) : super(key: key);

  _GoodsListState createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  @override
  Widget build(BuildContext context) {
    if (widget.goodsDataList.length != 0) {
      List<Widget> listWidget = widget.goodsDataList.map((val) {
        return InkWell(
          onTap: () {
            print('点击了商品');
          },
          child: Container(
            width: ScreenUtil.getInstance().setWidth(336),
            height: ScreenUtil.getInstance().setHeight(544),
            color: Colors.white,
            margin: EdgeInsets.only(
              bottom: ScreenUtil.getInstance().setHeight(19),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: <Widget>[
                      Image.network(
                        val['image'],
                        width: ScreenUtil.getInstance().setWidth(336),
                        height: ScreenUtil.getInstance().setHeight(336),
                        fit: BoxFit.cover,
                      ),
                      InkWell(
                        child: Image.asset(
                          'lib/assets/images/cart.png',
                          width: ScreenUtil.getInstance().setWidth(80),
                        ),
                        onTap: () {
                          print('点击了购物车');
                        },
                      ),
                    ],
                  ),
                  Container(
                    height: ScreenUtil.getInstance().setHeight(84),
                    child: Text(
                      'dfdsf${val['name']}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil.getInstance().setSp(30),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        margin: EdgeInsets.only(
                            top: ScreenUtil.getInstance().setWidth(25)),
                        height: ScreenUtil.getInstance().setHeight(37),
                        color: Color.fromRGBO(0, 169, 172, 0.3),
                        child: Text(
                          '净值:${val['price']}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 169, 172, 1),
                            fontSize: ScreenUtil.getInstance().setSp(24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '￥${val['mallPrice']}',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color.fromRGBO(235, 83, 74, 1),
                          fontSize: ScreenUtil.getInstance().setSp(36),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: ScreenUtil.getInstance().setWidth(14),
        runSpacing: ScreenUtil.getInstance().setHeight(15),
        children: listWidget,
      );
    } else {
      return Text('');
    }
  }
}