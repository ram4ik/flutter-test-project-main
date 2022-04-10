import 'package:flutter_tmdb_test/domain/models/movies_model.dart';
import 'package:flutter_tmdb_test/domain/repository/movies_repository.dart';

class FetchLatestMoviesUseCase {
  final MoviesRepository moviesRepository;

  const FetchLatestMoviesUseCase(this.moviesRepository);

  Future<List<MoviesResultModel>> call() async => moviesRepository.getLatestMovies();
}
