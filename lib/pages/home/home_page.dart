import 'package:flutter/material.dart';
import 'package:flutter_graduation/pages/home/goods_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:convert';
import 'top_navigator.dart';
import '../../components/swiper_widget.dart';
import '../../service/service_method.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  List<Map> goodsDataList = [];

  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

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
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getGoods();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      appBar: AppBar(
        title: TextFileWidget(),
      ),
      body: FutureBuilder(
        future: request('homePageContext',
            formData: {'lon': '115.02932', 'lat': '35.76189'}),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            List<Map> swiperDataList = (data['data']['slides'] as List).cast();
            List<Map> navigatorDataList =
                (data['data']['category'] as List).cast();
            return EasyRefresh(
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
                  Column(
                    children: <Widget>[
                      SwiperWidget(swiperDataList: swiperDataList),
                      TopNavigator(navigatorDataList: navigatorDataList),
                      GoodsList(goodsDataList: goodsDataList),
                    ],
                  ),
                ],
              ),
              onRefresh: () async {
                await _getGoods();
              },
              loadMore: () async {
                await _getGoods();
              },
            );
          } else {
            return Center(
              child: Text('加载中...'),
            );
          }
        },
      ),
    );
  }
}

/*贝塞尔曲线切割*/
class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - ScreenUtil.getInstance().setHeight(80));
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(
        size.width, size.height - ScreenUtil.getInstance().setHeight(80));
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(
        size.width, size.height - ScreenUtil.getInstance().setHeight(80));
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

/*轮播图*/
class SwiperWidget extends StatelessWidget {
  final List swiperDataList;

  const SwiperWidget({Key key, @required this.swiperDataList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: BottomClipper(),
          child: Container(
            height: ScreenUtil.getInstance().setHeight(295),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color.fromRGBO(0, 212, 214, 1),
                  Color.fromRGBO(0, 169, 172, 1)
                ],
                center: Alignment.topLeft,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              ScreenUtil.getInstance().setWidth(10),
            ),
          ),
          padding: EdgeInsets.all(
            ScreenUtil.getInstance().setWidth(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              ScreenUtil.getInstance().setWidth(10),
            ),
            child: SwiperDiy(swiperDataList: swiperDataList),
          ),
        )
      ],
    );
  }
}

/*搜索框*/
class TextFileWidget extends StatelessWidget {
  Widget buildTextField() {
    return TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 0.0),
        border: InputBorder.none,
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        hintText: "搜索商品关键词",
        hintStyle: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(28), color: Colors.white),
      ),
      style: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(28), color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget editView() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Color.fromRGBO(0, 212, 214, 0.5),
        ),
        alignment: Alignment.center,
        height: ScreenUtil.getInstance().setHeight(70),
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: buildTextField(),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: editView(),
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 5.0,
          ),
          child: Text("搜索"),
        )
      ],
    );
  }
}
