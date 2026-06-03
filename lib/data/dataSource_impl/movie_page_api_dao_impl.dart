import 'package:injectable/injectable.dart';
import 'package:movies/data/dataSource/movie_page_dao.dart';

import '../../core/remote/api/api_manager.dart';
import '../model/movies_response/Movie_response.dart';

@Injectable(as: MoviePageDao)
class MoviePageApiDaoImpl implements MoviePageDao{
  ApiManager apiManager;
  MoviePageApiDaoImpl(this.apiManager);
  @override
  Future<MovieResponse> fetchMovies()async {
    return apiManager.getMovies();
  }
}