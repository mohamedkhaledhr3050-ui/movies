import 'package:injectable/injectable.dart';
import 'package:movies/data/dataSource/movie_list_dao.dart';
import 'package:movies/repository/movie_list_repo.dart';

import '../model/movies_response/Movie_response.dart';

@Injectable(as: MovieListRepo)
class MovieListRepoImpl implements MovieListRepo {
  final MovieListDao movieListDao;
  MovieListRepoImpl(this.movieListDao);

  @override
  Future<MovieResponse> fetchMoviesByGenre(int genreId) async { // 👈 int
    return movieListDao.fetchMoviesByGenre(genreId);
  }
}