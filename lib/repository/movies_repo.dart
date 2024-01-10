import 'package:custody_rx/models/movies/movies_main.dart';

abstract class MovieRepo{
  Future<MoviesMain> getMoviesList();
}