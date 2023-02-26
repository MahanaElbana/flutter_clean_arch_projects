class Movie {
  final int id;
  final List<int> genreIds;
  final String title;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final String backdropPath;

  Movie({
    required this.id,
    required this.genreIds,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.backdropPath,
  });
}
