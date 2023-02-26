import 'package:movies_app_clean_arch_setstate/movies_module/domain/entities/moive.dart';
import 'package:movies_app_clean_arch_setstate/movies_module/domain/repository/base_movie_repository.dart';


class GetTopRatedMoviesUseCase {
 final BaseMovieRepository baseMovieRepository;
  GetTopRatedMoviesUseCase(this.baseMovieRepository);
  Future<List<Movie>> execute() async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}