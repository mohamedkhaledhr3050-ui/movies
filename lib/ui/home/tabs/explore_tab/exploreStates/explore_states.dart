import 'package:movies/data/model/movies_response/Movie.dart';

sealed class ExploreStates {}

class ExploreInitialState extends ExploreStates {}

class ExploreLoadingState extends ExploreStates {}

class ExploreSuccessState extends ExploreStates {
  final List<Movie> movies;
  ExploreSuccessState(this.movies);
}

class ExploreErrorState extends ExploreStates {
  final String message;
  ExploreErrorState(this.message);
}

class ExploreEmptyState extends ExploreStates {}