import 'package:custody_rx/base/base_network/network_service_impl.dart';
import 'package:custody_rx/repository/news_repo.dart';
import 'package:flutter/services.dart';

class NewsRepoImp implements NewsRepo {

  final _apiService = NetworkApiServiceImpl();
  static const int _pageSize = 10;

  //. This method read data from server
  // @override
  // Future getNewsData(String countryCode, String newsType) async {
  //   try {
  //     dynamic response = await _apiService.getAllNewsResponse(ApiEndPoints().getNewsList, countryCode, newsType);
  //     return response;
  //   } catch(e) {
  //     rethrow;
  //   }
  // }

  // This method read data from local JSON file
  @override
  Future getCountriesData() async {
    try {
      dynamic response = await rootBundle.loadString('assets/json/countries_data.json');
      return response;
    } catch(e) {
      rethrow;
    }
  }
}