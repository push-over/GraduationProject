import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  @override
  bool get wantKeepAlive => true;

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
            List<Map> navigatorDataList =
                (data['data']['category'] as List).cast();
            return Column(
              children: <Widget>[
                SwiperWidget(swiperDataList: swiperDataList),
                TopNavigator(navigatorDataList: navigatorDataList),
              ],
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
