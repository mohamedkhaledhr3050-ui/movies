
import '../../../../../data/model/movies_response/Movie.dart';

sealed class MovieListStates {}

class MovieListInitialState extends MovieListStates {}

class MovieListLoadingState extends MovieListStates{}

class MovieListErrorState extends MovieListStates{
  final String message;
  MovieListErrorState(this.message);
}

class MovieListSuccessState extends MovieListStates {
  // السكشن الأول (الاسم والأفلام بتاعته)
  final String title1;
  final List<Movie> movies1;

  // السكشن التاني
  final String title2;
  final List<Movie> movies2;

  // السكشن التالت
  final String title3;
  final List<Movie> movies3;

  MovieListSuccessState({
    required this.title1,
    required this.movies1,
    required this.title2,
    required this.movies2,
    required this.title3,
    required this.movies3,
  });
}