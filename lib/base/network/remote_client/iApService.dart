
import 'dart:io';

import 'package:custody_rx/base/network/external_values/iExternalValue.dart';
import 'package:dio/dio.dart';


abstract class IApiService {
  Dio get();
  void serviceGenerator(IExternalValues externalValues);
  BaseOptions getBaseOptions(IExternalValues externalValues);
  HttpClient Function()? httpClientCreate;
  void setIsTokenRequired(bool value);
  // bool isUser = true;
}