import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_tmdb_test/data/movies_repository_impl.dart';
import 'package:flutter_tmdb_test/domain/repository/movies_repository.dart';
import 'package:flutter_tmdb_test/domain/usecase/fetch_latest_movies_use_case.dart';
import 'package:flutter_tmdb_test/domain/usecase/fetch_popular_movies_use_case.dart';
import 'package:flutter_tmdb_test/domain/usecase/fetch_top_rated_movies_use_case.dart';
import 'package:flutter_tmdb_test/domain/usecase/fetch_upcoming_movies_use_case.dart';
import 'package:flutter_tmdb_test/networking/dio_client.dart';
import 'package:flutter_tmdb_test/networking/network_config.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DependencyModule {
  void setup() {
    getIt.registerSingleton<DioClient>(
      const DioClient(apiBaseUrl: NetworkConfig.baseUrl),
    );
    getIt.registerSingleton<MoviesRepository>(
      MoviesRepositoryImpl(dioClient: getIt(), key: dotenv.env['TMDB_KEY']),
    );
    getIt.registerSingleton(FetchLatestMoviesUseCase(getIt()));
    getIt.registerSingleton(FetchPopularMoviesUseCase(getIt()));
    getIt.registerSingleton(FetchTopRatedMoviesUseCase(getIt()));
    getIt.registerSingleton(FetchUpcomingMoviesUseCase(getIt()));
  }
}
