import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  const SwiperDiy({Key key, @required this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(260),
      child: Scaffold(
        body: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              "${swiperDataList[index]['image']}",
              fit: BoxFit.fill,
            );
          },
          itemCount: swiperDataList.length,
          pagination: SwiperPagination(),
          autoplay: true,
        ),
      ),
    );
  }
}
