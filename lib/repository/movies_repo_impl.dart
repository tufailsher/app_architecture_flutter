import 'package:custody_rx/base/base_network/api_end_points.dart';
import 'package:custody_rx/base/base_network/network_service_impl.dart';
import 'package:custody_rx/models/movies/movies_main.dart';
import 'package:custody_rx/repository/movies_repo.dart';
import 'package:flutter/material.dart';

class MovieRepoImp implements MovieRepo{
  final NetworkApiServiceImpl apiService;
  MovieRepoImp({required this.apiService});


  @override
  Future<MoviesMain> getMoviesList() async {
    try {
      dynamic response = await apiService.getResponse(
          ApiEndPoints.getMovies);
      debugPrint("MARAJ $response");
      final jsonData = MoviesMain.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }

  
}


 