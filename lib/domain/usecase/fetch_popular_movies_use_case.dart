import 'package:flutter_tmdb_test/domain/models/movies_model.dart';
import 'package:flutter_tmdb_test/domain/repository/movies_repository.dart';

class FetchPopularMoviesUseCase {
  final MoviesRepository moviesRepository;

  const FetchPopularMoviesUseCase(this.moviesRepository);

  Future<List<MoviesResultModel>> call() async => moviesRepository.getPopularMovies();
}
