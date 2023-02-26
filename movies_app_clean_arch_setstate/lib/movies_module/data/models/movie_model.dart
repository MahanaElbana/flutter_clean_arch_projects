import '../../domain/entities/moive.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.genreIds,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
    required super.backdropPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
      backdropPath: json['backdrop_path'],
    );
  }
}
