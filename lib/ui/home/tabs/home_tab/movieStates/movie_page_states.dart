
import '../../../../../data/model/movies_response/Movie.dart';

sealed class MoviePageStates {}

class MoviePageLoadingState extends MoviePageStates{}

class MoviePageErrorState extends MoviePageStates{
  String message;
  MoviePageErrorState(this.message);
}

class MoviePageSuccessState extends MoviePageStates{
  List<Movie>movies;
  MoviePageSuccessState(this.movies);
}