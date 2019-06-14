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
        return Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              width: ScreenUtil.getInstance().setWidth(750),
              height: ScreenUtil.getInstance().setHeight(100),
              decoration: BoxDecoration(),
              child: Text(
                '${val['name']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil.getInstance().setSp(28),
                ),
              ),
            ),
          ],
        );
      }).toList();
      return Column(children: listWidget);
    } else {
      return Text('');
    }
  }
}
