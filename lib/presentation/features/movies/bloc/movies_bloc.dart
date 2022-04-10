import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tmdb_test/domain/models/movies_model.dart';
import 'package:flutter_tmdb_test/domain/usecase/fetch_latest_movies_use_case.dart';
import 'package:flutter_tmdb_test/domain/usecase/fetch_popular_movies_use_case.dart';
import 'package:flutter_tmdb_test/domain/usecase/fetch_top_rated_movies_use_case.dart';
import 'package:flutter_tmdb_test/domain/usecase/fetch_upcoming_movies_use_case.dart';
import 'package:flutter_tmdb_test/networking/network_config.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final FetchLatestMoviesUseCase fetchLatestMoviesUseCase;
  final FetchPopularMoviesUseCase fetchPopularMoviesUseCase;
  final FetchTopRatedMoviesUseCase fetchTopRatedMoviesUseCase;
  final FetchUpcomingMoviesUseCase fetchUpcomingMoviesUseCase;
  Timer? _timer;

  MoviesBloc(
    this.fetchLatestMoviesUseCase,
    this.fetchPopularMoviesUseCase,
    this.fetchTopRatedMoviesUseCase,
    this.fetchUpcomingMoviesUseCase,
  ) : super(const MoviesListState()) {
    on<InitEvent>((event, emit) => _init(emit));
    on<TopRatedEvent>((event, emit) => _getTopRatedMovies(emit));
    on<UpcomingEvent>((event, emit) => _getUpcomingMovies(emit));
    on<LatestEvent>((event, emit) => _onLatestMovies(emit));
  }

  Future<void> _init(Emitter<MoviesState> emit) async {
    final latest = await _getLatestMovies();
    final popular = await _getPopularMovies();
    var imageUrl = "";
    if (popular.isNotEmpty && popular.first.posterPath != null) {
      imageUrl = NetworkConfig.imageBaseUrl + (popular.first.posterPath ?? "");
    }
    _initTimer();
    emit(MoviesListState(
      headerImage: imageUrl,
      latestMovies: latest,
      popularMovies: popular,
    ));
  }

  void _initTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 30),
      (t) => add(LatestEvent()),
    );
  }

  Future<void> _onLatestMovies(Emitter<MoviesState> emit) async {
    try {
      final latest = await _getLatestMovies();
      emit((state as MoviesListState).copyWith(latestMovies: latest));
    } catch (_) {}
  }

  Future<List<MoviesResultModel>> _getLatestMovies() async {
    try {
      return await fetchLatestMoviesUseCase();
    } catch (_) {
      return [];
    }
  }

  Future<List<MoviesResultModel>> _getPopularMovies() async {
    try {
      return await fetchPopularMoviesUseCase();
    } catch (_) {
      return [];
    }
  }

  Future<void> _getTopRatedMovies(Emitter<MoviesState> emit) async {
    try {
      final topRated = await fetchTopRatedMoviesUseCase();
      emit((state as MoviesListState).copyWith(topRatedMovies: topRated));
    } catch (_) {}
  }

  Future<void> _getUpcomingMovies(Emitter<MoviesState> emit) async {
    try {
      final upcoming = await fetchUpcomingMoviesUseCase();
      emit((state as MoviesListState).copyWith(upcomingMovies: upcoming));
    } catch (_) {}
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
