import 'package:movies_app_clean_arch_setstate/movies_module/data/data_source/remote_movies_data_source.dart';
import 'package:movies_app_clean_arch_setstate/movies_module/data/repository/movie_repository.dart';
import 'package:movies_app_clean_arch_setstate/movies_module/domain/entities/moive.dart';
import 'package:movies_app_clean_arch_setstate/movies_module/domain/repository/base_movie_repository.dart';
import 'package:movies_app_clean_arch_setstate/movies_module/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app_clean_arch_setstate/movies_module/domain/usecases/get_popular_movies.dart';
import 'package:movies_app_clean_arch_setstate/movies_module/domain/usecases/get_top_rated_movies_usecase.dart';

class MovieController {
  static BaseRemoteMoviesDataSource baseRemoteMoviesDataSource =
      RemoteMoviesDataSource();
  static BaseMovieRepository baseMovieRepository =
      MovieRepository(baseRemoteMoviesDataSource);

  static Future<List<Movie>> getNowPlayingDataFromServer() async {
    return await GetNowPlayingMovies(baseMovieRepository).execute();
  }

  static Future<List<Movie>> getPopularDataFromServer() async {
    return await GetPopularMoviesUseCase(baseMovieRepository).execute();
  }

  static Future<List<Movie>> getTopRatedDataFromServer() async {
    return await GetTopRatedMoviesUseCase(baseMovieRepository).execute();
  }
}
