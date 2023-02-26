import 'package:movies_app_clean_arch_setstate/movies_module/data/data_source/remote_movies_data_source.dart';
import 'package:movies_app_clean_arch_setstate/movies_module/domain/entities/moive.dart';
import 'package:movies_app_clean_arch_setstate/movies_module/domain/repository/base_movie_repository.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseRemoteMoviesDataSource remoteMoviesDataSource;

  MovieRepository(this.remoteMoviesDataSource);

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    return await remoteMoviesDataSource.getNowPlayingMovies();
  }

  @override
  Future<List<Movie>> getPopularMovies() async{
   return await remoteMoviesDataSource.getPopularMovies();
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async{
  return await remoteMoviesDataSource.getTopRatedMovies();
  }
}
