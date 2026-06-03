
import '../model/movies_response/Movie_response.dart';

abstract interface class MoviePageDao {
  Future<MovieResponse>fetchMovies();
}