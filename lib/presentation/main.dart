import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_tmdb_test/di/dependecy_module.dart';
import 'package:flutter_tmdb_test/domain/usecase/fetch_latest_movies_use_case.dart';
import 'package:flutter_tmdb_test/domain/usecase/fetch_popular_movies_use_case.dart';
import 'package:flutter_tmdb_test/domain/usecase/fetch_top_rated_movies_use_case.dart';
import 'package:flutter_tmdb_test/domain/usecase/fetch_upcoming_movies_use_case.dart';
import 'package:flutter_tmdb_test/presentation/features/movies/bloc/movies_bloc.dart';
import 'package:flutter_tmdb_test/presentation/features/movies/view/movies_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  DependencyModule().setup();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primaryColor: const Color(0xFF41A721),
        primaryColorDark: const Color(0xFF1A422A),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      home: const MoviesView(),
    );
  }
}

class MoviesView extends StatelessWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(
        getIt<FetchLatestMoviesUseCase>(),
        getIt<FetchPopularMoviesUseCase>(),
        getIt<FetchTopRatedMoviesUseCase>(),
        getIt<FetchUpcomingMoviesUseCase>(),
      )..add(InitEvent()),
      child: const MoviesPage(),
    );
  }
}
