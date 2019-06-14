import 'package:flutter/material.dart';
import '../../components/swiper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsDetailPage extends StatefulWidget {
  final goodsData;
  GoodsDetailPage({Key key, @required this.goodsData}) : super(key: key);

  _GoodsDetailPageState createState() => _GoodsDetailPageState();
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  @override
  Widget build(BuildContext context) {
    List swiperDataList = [
      {'image': widget.goodsData['image']},
    ];
    return Container(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  child: SwiperDiy(
                    swiperDataList: swiperDataList,
                    heightNumber: 700,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                Positioned(
                  top: 20,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 26, left: 15, right: 15),
              width: ScreenUtil.getInstance().setWidth(750),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.goodsData['name'],
                      style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(36),
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '￥${widget.goodsData['mallPrice']}',
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(42),
                            color: Color.fromRGBO(235, 83, 74, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        margin: EdgeInsets.only(
                          left: ScreenUtil.getInstance().setWidth(10),
                        ),
                        height: ScreenUtil.getInstance().setHeight(37),
                        color: Color.fromRGBO(0, 169, 172, 0.3),
                        child: Text(
                          '净值:${widget.goodsData['price']}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 169, 172, 1),
                            fontSize: ScreenUtil.getInstance().setSp(24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, bottom: 3),
                    child: Divider(
                      height: 1.0,
                      indent: 0.0,
                      color: Colors.black26,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 28),
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.black12),
                    // ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            '产品特点',
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(30),
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '添加15種營養素，5種膳食纖維，富含人體所需的蛋白質、維生素、礦物質和其他微量元素；每份代餐熱量僅為84大卡：低熱量、低脂肪、低膽固醇；非轉基因植物蛋白；易於調制，方便快捷。',
                          style: TextStyle(color: Colors.black54, fontSize: ScreenUtil.getInstance().setSp(30)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
