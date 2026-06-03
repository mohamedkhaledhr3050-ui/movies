import 'package:injectable/injectable.dart';
import 'package:movies/core/remote/api/api_manager.dart';
import 'package:movies/data/dataSource/movie_details_dao.dart';
import 'package:movies/data/model/movies_response/Movie_response.dart';

@Injectable(as:MovieDetailsDao )
class MovieDetailsApiDaoImpl implements MovieDetailsDao{
  final ApiManager apiManager;
  MovieDetailsApiDaoImpl(this.apiManager);

  @override
  Future<MovieResponse> fetchMovieDetails(int movieId) {
    return apiManager.getMovieDetails(movieId);
  }

  @override
  Future<MovieResponse> fetchMovieSuggestions(int movieId) {
    return apiManager.getMovieSuggestions(movieId);
  }

}