import 'package:movies_app_clean_arch_setstate/keys/api_key.dart';

class MovieApiConstance {
  
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => "$baseImageUrl$path";

  static const String nowPlayingMoviesUrl = "$baseUrl/movie/now_playing?api_key=${AppKeys.apiKey}";
  static const String topRatedMoviesUrl = "$baseUrl/movie/top_rated?api_key=${AppKeys.apiKey}";
  static const String popularMoviesUrl = "$baseUrl/movie/popular?api_key=${AppKeys.apiKey}";
}

