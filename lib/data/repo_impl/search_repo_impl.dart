import 'package:injectable/injectable.dart';
import 'package:movies/data/dataSource/search_dao.dart';
import 'package:movies/data/model/movies_response/Movie_response.dart';
import 'package:movies/repository/search_repo.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo{
  SearchDao searchDao;
  SearchRepoImpl(this.searchDao);

  @override
  Future<MovieResponse> fetchMoviesBySearch(String searchQuery) {
    return searchDao.fetchMoviesBySearch(searchQuery);
  }
}