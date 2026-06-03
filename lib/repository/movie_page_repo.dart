
import '../data/model/movies_response/Movie_response.dart';

abstract interface class MoviePageRepo {
  Future<MovieResponse>fetchMovie();
}