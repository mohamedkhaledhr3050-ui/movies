import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/app_constants.dart';

import '../../../data/model/movies_response/Movie_response.dart';

@lazySingleton
class ApiManager {
  late final Dio dio;

  ApiManager() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<MovieResponse> getMovies() async {
    var response = await dio.get(
      "list_movies.json",
      queryParameters: {"limit": 10, "sort_by": "year", "order_by": "desc"},
    );
    var moviesResponse = MovieResponse.fromJson(response.data);
    return moviesResponse;
  }

  Future<MovieResponse> getMoviesByGenre(int genreId) async {
    String genreName = AppConstants.genresMap[genreId] ?? "All";
    var response = await dio.get(
      "list_movies.json",
      queryParameters: {
        "genre": genreName,
        "sort_by": "date_added",
        "order_by": "desc",
      },
    );
    return MovieResponse.fromJson(response.data);
  }

  Future<MovieResponse> getMovieDetails(int movieId) async {
    var response = await dio.get("movie_details.json", queryParameters: {
      "movie_id":movieId,
      "with_images": true,
      "with_cast": true,
    });
    return MovieResponse.fromJson(response.data);
  }

  Future<MovieResponse> getMovieSuggestions(int movieId)async{
    var response = await dio.get('movie_suggestions.json', queryParameters: {
      "movie_id": movieId
    });

    return MovieResponse.fromJson(response.data);
  }
}
