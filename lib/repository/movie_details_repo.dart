import 'package:movies/data/model/movies_response/Movie_response.dart';

abstract interface class MovieDetailsRepo {
  Future<MovieResponse>fetchMovieDetails(int movieId);
  Future<MovieResponse>fetchMovieSuggestions(int movieId);

}