import 'package:injectable/injectable.dart';
import 'package:movies/core/remote/api/api_manager.dart';
import 'package:movies/data/dataSource/movie_list_dao.dart';

import '../model/movies_response/Movie_response.dart';

@Injectable(as: MovieListDao)
class MovieListApiDaoImpl implements MovieListDao {
  final ApiManager apiManager;
  MovieListApiDaoImpl(this.apiManager);

  @override
  Future<MovieResponse> fetchMoviesByGenre(int genreId) async { // 👈 int
    return apiManager.getMoviesByGenre(genreId);
  }
}