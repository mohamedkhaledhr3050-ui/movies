import 'package:injectable/injectable.dart';
import 'package:movies/core/remote/api/api_manager.dart';
import 'package:movies/data/dataSource/search_dao.dart';
import 'package:movies/data/model/movies_response/Movie_response.dart';

@Injectable(as: SearchDao)

class SearchDaoImpl implements SearchDao{
  ApiManager apiManager;
  SearchDaoImpl(this.apiManager);

  @override
  Future<MovieResponse> fetchMoviesBySearch(String searchQuery) {
    return apiManager.searchMovies(searchQuery);
  }
}