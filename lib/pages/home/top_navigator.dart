import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNavigator extends StatefulWidget {
  final List navigatorDataList;
  TopNavigator({Key key, @required this.navigatorDataList}) : super(key: key);

  _TopNavigatorState createState() => _TopNavigatorState();
}

class _TopNavigatorState extends State<TopNavigator> {
  String topNavigatorSelected = '白酒';
  Widget topNavigatorPage;

  Widget __gridViewItemUI(BuildContext context, item) {
    if (topNavigatorSelected == item['mallCategoryName']) {
      setState(() {
        topNavigatorPage = Stack(
          alignment: const Alignment(0.0, 0.6),
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image.asset(
                'lib/assets/images/selected.png',
                fit: BoxFit.cover,
                width: ScreenUtil.getInstance().setWidth(150),
                height: ScreenUtil.getInstance().setHeight(64),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: ScreenUtil.getInstance().setHeight(64),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                item['mallCategoryName'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil.getInstance().setSp(26),
                ),
              ),
            ),
          ],
        );
      });
    } else {
      setState(() {
        topNavigatorPage = Container(
          alignment: Alignment.center,
          height: ScreenUtil.getInstance().setHeight(64),
          decoration: BoxDecoration(
            color: Color.fromRGBO(238, 238, 238, 1),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            item['mallCategoryName'],
            style: TextStyle(
              color: Color.fromRGBO(51, 51, 51, 1),
              fontSize: ScreenUtil.getInstance().setSp(26),
            ),
          ),
        );
      });
    }
    return InkWell(
      onTap: () {
        setState(() {
          topNavigatorSelected = item['mallCategoryName'];
        });
      },
      child: Column(
        children: <Widget>[topNavigatorPage],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.navigatorDataList.length > 8) {
      widget.navigatorDataList.removeRange(8, widget.navigatorDataList.length);
    }
    return Container(
      height: ScreenUtil.getInstance().setHeight(200),
      child: GridView.count(
        crossAxisCount: 4,
        // padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(30)),
        padding: EdgeInsets.only(
          top: ScreenUtil.getInstance().setHeight(10),
          left: ScreenUtil.getInstance().setWidth(30),
          right: ScreenUtil.getInstance().setWidth(30),
        ),
        crossAxisSpacing: ScreenUtil.getInstance().setWidth(30),
        childAspectRatio: 2.0,
        children: widget.navigatorDataList.map((item) {
          return __gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}
