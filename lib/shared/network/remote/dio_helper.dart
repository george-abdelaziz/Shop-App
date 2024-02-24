import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import '../../components/constants.dart';

class DioHelper {
  static late Dio dio;
  static Logger logger = Logger();
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang':lang,
      'Content-Type': 'application/json',
      'Authorization': token??'',
    };
    Response response = await dio.get(
      url,
      queryParameters: query,
    );
    // printFullText(response.toString());
    // logger.e(response.toString());
    // logger.e('11111111111111111111111111111111111111111111111111111111111111111111111111');
    return await dio.get(
      url,
      queryParameters: query,
    );;
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang':lang,
      'Authorization': token??'',
      'Content-Type': 'application/json',
    };
    Response response = await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
    // printFullText(response.toString());
    return response;
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang':lang,
      'Authorization': token??'',
      'Content-Type': 'application/json',
    };
    Response response = await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
    // printFullText(response.toString());
    return response;
  }
}
