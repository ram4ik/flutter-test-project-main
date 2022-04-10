part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object?> get props => [];
}

class InitEvent extends MoviesEvent {}

class TopRatedEvent extends MoviesEvent {}

class LatestEvent extends MoviesEvent {}

class UpcomingEvent extends MoviesEvent {}
