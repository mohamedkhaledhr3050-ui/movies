import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/app_constants.dart';
import 'package:movies/repository/movie_list_repo.dart';
import 'package:movies/ui/home/tabs/home_tab/movieStates/movie_list_states.dart';

@injectable
class MovieListViewModel extends Cubit<MovieListStates>{
  final MovieListRepo movieListRepo;
  MovieListViewModel(this.movieListRepo): super(MovieListInitialState());

  Future<void> getMoviesByGenre() async {
    emit(MovieListLoadingState());
    try {
      List<String> names = AppConstants.movieGenres.keys.toList();
      names.shuffle();

      final genre1Name = names[0];
      final genre2Name = names[1];
      final genre3Name = names[2];

      final int genre1Id = AppConstants.movieGenres[genre1Name]!;
      final int genre2Id = AppConstants.movieGenres[genre2Name]!;
      final int genre3Id = AppConstants.movieGenres[genre3Name]!;

      var response1 = await movieListRepo.fetchMoviesByGenre(genre1Id);
      var response2 = await movieListRepo.fetchMoviesByGenre(genre2Id);
      var response3 = await movieListRepo.fetchMoviesByGenre(genre3Id);

      var movies1 = response1.data?.movies;
      var movies2 = response2.data?.movies;
      var movies3 = response3.data?.movies;

      if (movies1 != null && movies2 != null && movies3 != null) {
        emit(MovieListSuccessState(
          title1: genre1Name,
          movies1: movies1,
          title2: genre2Name,
          movies2: movies2,
          title3: genre3Name,
          movies3: movies3,
        ));
      } else {
        emit(MovieListErrorState("لم يتم العثور على أفلام لهذه التصنيفات"));
      }
    } catch (e) {
      emit(MovieListErrorState("فشل الاتصال بالسيرفر، تأكد من الإنترنت."));
    }
  }
}