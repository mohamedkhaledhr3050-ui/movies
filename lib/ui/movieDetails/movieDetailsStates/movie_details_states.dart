import 'package:movies/data/model/movies_response/Movie.dart';

sealed class MovieDetailsStates {}

class MovieDetailsInitialState extends MovieDetailsStates {}

class MovieDetailsLoadingState extends MovieDetailsStates {}

class MovieDetailsErrorState extends MovieDetailsStates {
  final String message;
  MovieDetailsErrorState(this.message);
}

class MovieDetailsSuccessState extends MovieDetailsStates {
  final Movie movie;
  final List<Movie> similarMovies;
  MovieDetailsSuccessState(this.movie, this.similarMovies);
}