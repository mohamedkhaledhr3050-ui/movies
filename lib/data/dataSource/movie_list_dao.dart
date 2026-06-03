
import '../model/movies_response/Movie_response.dart';

abstract interface class MovieListDao {
  Future<MovieResponse> fetchMoviesByGenre(int genreId); // 👈 عدلها لـ int
}