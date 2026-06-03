import 'Movie.dart';

class Data {
  Data({
    this.movieCount,
    this.limit,
    this.pageNumber,
    this.movies,
    this.movie,
  });

  Data.fromJson(dynamic json) {
    movieCount = json['movie_count'];
    limit = json['limit'];
    pageNumber = json['page_number'];

    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies?.add(Movie.fromJson(v));
      });
    }

    if (json['movie'] != null) {
      movie = Movie.fromJson(json['movie']);
    }
  }

  num? movieCount;
  num? limit;
  num? pageNumber;
  List<Movie>? movies;
  Movie? movie;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movie_count'] = movieCount;
    map['limit'] = limit;
    map['page_number'] = pageNumber;
    if (movies != null) {
      map['movies'] = movies?.map((v) => v.toJson()).toList();
    }
    if (movie != null) {
      map['movie'] = movie?.toJson();
    }
    return map;
  }
}