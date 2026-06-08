import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/repository/movie_list_repo.dart';
import 'package:movies/ui/home/tabs/explore_tab/exploreStates/explore_states.dart';

@injectable

class ExploreViewModel extends Cubit<ExploreStates>{
  MovieListRepo movieListRepo;
  ExploreViewModel(this.movieListRepo): super(ExploreInitialState());

  Future<void> getMoviesByGenre(int genreId)async{
    emit(ExploreLoadingState());
    try{
      var response = await movieListRepo.fetchMoviesByGenre(genreId);
      final movies = response.data?.movies;

      if(movies != null && movies.isNotEmpty){
        emit(ExploreSuccessState(movies));
      }
      else{
        emit(ExploreEmptyState());
      }
    }
    catch(e){
      emit(ExploreErrorState("Failed to retrieve movies"));
    }
  }
}