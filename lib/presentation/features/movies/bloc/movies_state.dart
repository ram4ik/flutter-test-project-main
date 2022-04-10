part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
}

class MoviesListState extends MoviesState {
  final String headerImage;
  final List<MoviesResultModel> latestMovies;
  final List<MoviesResultModel> popularMovies;
  final List<MoviesResultModel> topRatedMovies;
  final List<MoviesResultModel> upcomingMovies;

  const MoviesListState({
    this.headerImage = "",
    this.latestMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.upcomingMovies = const [],
  });

  MoviesListState copyWith({
    String? headerImage,
    List<MoviesResultModel>? latestMovies,
    List<MoviesResultModel>? popularMovies,
    List<MoviesResultModel>? topRatedMovies,
    List<MoviesResultModel>? upcomingMovies,
  }) {
    return MoviesListState(
      headerImage: headerImage ?? this.headerImage,
      latestMovies: latestMovies ?? this.latestMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
    );
  }

  @override
  List<Object?> get props => [
        headerImage,
        latestMovies,
        popularMovies,
        topRatedMovies,
        upcomingMovies,
      ];
}
