import 'package:injectable/injectable.dart';
import 'package:movies/data/dataSource/movie_details_dao.dart';
import 'package:movies/data/model/movies_response/Movie_response.dart';
import 'package:movies/repository/movie_details_repo.dart';

@Injectable(as:MovieDetailsRepo )
class MovieDetailsRepoImpl implements MovieDetailsRepo{
  MovieDetailsDao movieDetailsDao;
  MovieDetailsRepoImpl(this.movieDetailsDao);

  @override
  Future<MovieResponse> fetchMovieDetails(int movieId) {
    return movieDetailsDao.fetchMovieDetails(movieId);
  }

  @override
  Future<MovieResponse> fetchMovieSuggestions(int movieId) {
    return movieDetailsDao.fetchMovieSuggestions(movieId);
  }
}