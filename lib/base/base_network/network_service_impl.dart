import 'dart:convert';
import 'dart:io';

import 'package:custody_rx/app/common/logger.dart';
import 'package:custody_rx/base/base_network/app_exceptions.dart';
import 'package:custody_rx/base/base_network/base_api_service.dart';
import 'package:custody_rx/base/enums.dart';
import 'package:custody_rx/di.dart';
import 'package:http/http.dart'as http;

class NetworkApiServiceImpl implements BaseApiService {
  final Environment environment = inject.get<Environment>();

  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
    Future postResponse(String url, Map<String, String> jsonBody) async{
      dynamic responseJson;
      try {
        final response = await http.post(Uri.parse(baseUrl + url),body: jsonBody);
        responseJson = returnResponse(response);
        d(responseJson);
      } on SocketException {
        throw FetchDataException('No Internet Connection');
      }
      return responseJson;
    }
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        throw UnauthorisedException(responseJson['message']);
      case 500:
      default:
        throw FetchDataException('Error occurred while communication with server with status code : ${response.statusCode}');
    }
  }
  @override
  String get baseUrl {
    switch (environment) {
      case Environment.DEV:
        return 'http://test-devserver.custodyrx.net:9000';
      case Environment.PROD:
        return 'https://prod.example.com';
      default:
        return 'https://prod.example.com';
    }
  }
  
  @override
  String get apiKey => "your_api_key";
  
  // @override
  // String get baseUrl => "google.com";
}