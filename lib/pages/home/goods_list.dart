import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../detail/goods_detail_page.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GoodsDetailPage(goodsData: val),
              ),
            );
          },
          child: Container(
            width: ScreenUtil.getInstance().setWidth(336),
            height: ScreenUtil.getInstance().setHeight(544),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0)
              ],
            ),
            margin: EdgeInsets.only(
              bottom: ScreenUtil.getInstance().setHeight(19),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        child: Image.network(
                          val['image'],
                          width: ScreenUtil.getInstance().setWidth(336),
                          height: ScreenUtil.getInstance().setHeight(336),
                          fit: BoxFit.cover,
                        ),
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
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil.getInstance().setHeight(84),
                    child: Text(
                      '${val['name']}',
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
                          top: ScreenUtil.getInstance().setWidth(25),
                        ),
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
                          fontWeight: FontWeight.bold,
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
