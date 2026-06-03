
import '../data/model/movies_response/Movie_response.dart';

abstract interface class MovieListRepo {
  Future<MovieResponse> fetchMoviesByGenre(int genreId); // 👈 عدلها لـ int
}