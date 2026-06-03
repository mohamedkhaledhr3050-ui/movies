import 'package:injectable/injectable.dart';
import 'package:movies/data/dataSource/movie_page_dao.dart';
import 'package:movies/repository/movie_page_repo.dart';

import '../model/movies_response/Movie_response.dart';

@Injectable(as:MoviePageRepo )
class MoviePageRepoImpl implements MoviePageRepo{
  MoviePageDao moviePageDao;
  MoviePageRepoImpl(this.moviePageDao);

  @override
  Future<MovieResponse> fetchMovie()async {
    return moviePageDao.fetchMovies();
  }
}