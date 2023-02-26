import 'package:dio/dio.dart';
import 'package:movies_app_clean_arch_setstate/core/utils/api_constance.dart';

import 'package:movies_app_clean_arch_setstate/movies_module/data/models/movie_model.dart';

abstract class BaseRemoteMoviesDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class RemoteMoviesDataSource extends BaseRemoteMoviesDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final response =
          await Dio().get(MovieApiConstance.nowPlayingMoviesUrl);

      List<MovieModel> succcessData =
          List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
      return succcessData;
    } catch (error) {
      // TODO The return is empty list in existing error (NEED A SOLUTION) 
      return [];
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    try {
      final response =
          await Dio().get(MovieApiConstance.popularMoviesUrl);

      List<MovieModel> succcessData =
          List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
      return succcessData;
    } catch (error) {
      // TODO The return is empty list in existing error (NEED A SOLUTION) 
      return [];
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
   try {
      final response =
          await Dio().get(MovieApiConstance.topRatedMoviesUrl);

      List<MovieModel> succcessData =
          List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
      return succcessData;
    } catch (error) {
      // TODO The return is empty list in existing error (NEED A SOLUTION) 
      return [];
    }
  }
}
