import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

Future request(url, {formData}) async {
  try {
    print('请求接口...');
    Response response;
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    if (formData != null) {
      response = await dio.post(servicePath[url], data: formData);
    } else {
      response = await dio.post(servicePath[url]);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口异常...');
    }
  } catch (e) {
    return print("ERROR ========> " + e);
  }
}

Future getHomePageContext() async {
  try {
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    Response response =
        await dio.post(servicePath['homePageContext'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print("ERROR ========> " + e);
  }
}

Future getHomePageBelowconten() async {
  try {
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    int page = 1;
    Response response =
        await dio.post(servicePath['homePageBelowConten'], data: page);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print("ERROR ========> " + e);
  }
}
