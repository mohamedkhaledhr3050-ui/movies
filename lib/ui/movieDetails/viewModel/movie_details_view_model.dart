import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/repository/movie_details_repo.dart';
import 'package:movies/ui/movieDetails/movieDetailsStates/movie_details_states.dart';

@injectable

class MovieDetailsViewModel extends Cubit<MovieDetailsStates>{
  final MovieDetailsRepo movieDetailsRepo;
  MovieDetailsViewModel(this.movieDetailsRepo): super(MovieDetailsInitialState());

  Future<void>getMovieDetails(int movieId)async{
    try{
      emit(MovieDetailsLoadingState());
      var response = await movieDetailsRepo.fetchMovieDetails(movieId);
      var detailedMovie = response.data?.movie;
      var suggestionResponse = await movieDetailsRepo.fetchMovieSuggestions(movieId);
      var similarMovies = suggestionResponse.data?.movies??[];
      if(detailedMovie != null){
        emit(MovieDetailsSuccessState(detailedMovie, similarMovies));
      }
      else{
        emit(MovieDetailsErrorState("Movie Details Not found"));
      }
    }
    catch(e){
      emit(MovieDetailsErrorState("No Internet Connection"));
    }
  }

}