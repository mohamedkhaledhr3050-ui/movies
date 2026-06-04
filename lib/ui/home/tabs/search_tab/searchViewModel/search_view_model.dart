import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/repository/search_repo.dart';
import 'package:movies/ui/home/tabs/search_tab/searchStates/search_states.dart';

@injectable
class SearchViewModel extends Cubit<SearchStates> {
  SearchRepo searchRepo;
  Timer? _debounceTimer; // 2. المتغير اللي هيراقب الكتابة

  SearchViewModel(this.searchRepo) : super(SearchInitialState());

  void searchMovies(String searchQuery) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {

      if (searchQuery.isEmpty) {
        emit(SearchInitialState());
        return;
      }

      emit(SearchLoadingState());
      try {
        var response = await searchRepo.fetchMoviesBySearch(searchQuery);
        final movies = response.data?.movies;

        if (response.statusMessage == "error") {
          emit(SearchErrorState("Something went wrong with the server"));
          return;
        }

        if (response.statusMessage != "error" && movies != null && movies.isNotEmpty) {
          emit(SearchSuccessState(movies));
        } else if (movies != null && movies.isEmpty) {
          emit(SearchEmptyState());
        } else {
          emit(SearchErrorState("No Movies Found!"));
        }
      } catch (e) {
        emit(SearchErrorState("No Internet Connection"));
      }
    });
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}