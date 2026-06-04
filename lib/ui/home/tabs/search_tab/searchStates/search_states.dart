import '../../../../../data/model/movies_response/Movie.dart';

sealed class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates{}


class SearchErrorState extends SearchStates {
  final String message;
  SearchErrorState(this.message);
}

class SearchEmptyState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  final List<Movie> movies;
  SearchSuccessState(this.movies);
}