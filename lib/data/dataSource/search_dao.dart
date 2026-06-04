import 'package:movies/data/model/movies_response/Movie_response.dart';

abstract interface class SearchDao {
  Future<MovieResponse> fetchMoviesBySearch(String searchQuery);
}