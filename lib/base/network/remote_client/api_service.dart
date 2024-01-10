import 'dart:io';

import 'package:custody_rx/app/common/logger.dart';
import 'package:custody_rx/base/network/external_values/iExternalValue.dart';
import 'package:custody_rx/base/network/remote_client/iApService.dart';
import 'package:custody_rx/repository/jwt_access_repo.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const Duration requestTimeOut = Duration(seconds: 30);

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class ApiService extends Interceptor implements IApiService {
  
  ApiService.create(
      {required IExternalValues externalValues, required this.jwtAccessRepo, this.isTokenRequired=true}) {
    serviceGenerator(externalValues);
  }
  JwtAccessRepo jwtAccessRepo;
  bool isTokenRequired = true;

  @override
  Dio get() => _dio;

  @override
  BaseOptions getBaseOptions(IExternalValues externalValues) {
    return BaseOptions(
        baseUrl: externalValues.getBaseUrlv1(),
        receiveDataWhenStatusError: true,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        connectTimeout: requestTimeOut,
        receiveTimeout: requestTimeOut);
  }

  @override
  HttpClient Function() get httpClientCreate {
    return () {
      HttpClient client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  @override
  void serviceGenerator(IExternalValues externalValues) {
    _dio = Dio(getBaseOptions(externalValues));
    _dio.interceptors.add(this);
    _dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
        httpClientCreate;
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    d("onRequest");
    d('path: ${options.path}');
    d('TOKEN REQUIRED : $isTokenRequired');

    // if (isTokenRequired) {
      // inject<JwtLocalAccessToken>().checkToken();
      String? token = await jwtAccessRepo.loadAccessToken;
      options.headers
          .addAll({HttpHeaders.authorizationHeader: 'Bearer $token'});
    // }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    d("onResponse");
    d('status code: ${response.statusCode}');

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    d("onError");
    d('status code: ${err.response?.statusCode}');
    return handler.next(err);
  }

  late Dio _dio;

  @override
  void setIsTokenRequired(bool value) {
    isTokenRequired = value;
  }
  
  @override
  set httpClientCreate(HttpClient Function()? _httpClientCreate) {
  
  }
  
  // @override
  // bool isUser;
}
