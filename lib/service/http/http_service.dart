import 'package:app/util/bearer_token.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../config/app_config.dart';
import '../../interface/base_model_interface.dart';

enum RequestType { GET, POST, PUT, PATCH, DELETE }

class HttpService {
  Dio dio;

  final BearerToken bearerToken = BearerToken();
  AppConfig appConfig = AppConfig();

  HttpService({this.dio}) {
    this.configInitApi();
  }

  Future<T> request<T>({
    @required RequestType type,
    @required String path,
    BaseModelInterface dataResponse,
    BaseModelInterface dataRequest,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      dynamic res = await dio.request(
        path,
        data: dataRequest?.toJson(),
        queryParameters: queryParameters,
        options: _checkOptions(type.toString().split('.').last, options),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (dataResponse == null) {
        return res.data;
      }
      if (res?.data is List) {
        return dataResponse.fromJsonArray(res?.data) as T ?? res?.data as T;
      }
      return dataResponse.fromJson(res?.data) as T ?? res?.data as T;
    } catch (error) {
      print(error);
    }
  }

  configInitApi() async {
    dio = Dio(
      BaseOptions(
        baseUrl: appConfig.baseUrl,
        validateStatus: (status) => status < 400,
        receiveTimeout: 20000,
        connectTimeout: 20000,
      ),
    );
  }


  Options _checkOptions(String method, options) {
    options ??= Options();
    options.method = method;
    return options;
  }

}
