import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/repository/movie_page_repo.dart';

import '../movieStates/movie_page_states.dart';

@injectable
class MoviePageViewModel extends Cubit<MoviePageStates> {
  final MoviePageRepo moviePageRepo;

  MoviePageViewModel(this.moviePageRepo): super(MoviePageLoadingState());

  Future<void> getMoviePage() async {
    try {
      emit(MoviePageLoadingState());
      var response = await moviePageRepo.fetchMovie();

      var moviesList = response.data?.movies;

      if (moviesList != null && moviesList.isNotEmpty) {
        emit(MoviePageSuccessState(moviesList));
      } else {
        emit(MoviePageErrorState("لم يتم العثور على أفلام"));
      }
    } catch (e) {
      emit(MoviePageErrorState("فشل الاتصال بالسيرفر، تأكد من الإنترنت."));
    }
  }
}