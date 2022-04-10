import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmdb_test/presentation/features/movies/bloc/movies_bloc.dart';
import 'package:flutter_tmdb_test/presentation/features/movies/view/header_image.dart';
import 'package:flutter_tmdb_test/presentation/features/movies/view/movies_expansion_section.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<MoviesBloc>(context),
      builder: (context, state) {
        final currentState = (state as MoviesListState);
        final bloc = BlocProvider.of<MoviesBloc>(context);
        return Scaffold(
          backgroundColor: const Color(0x4949B356),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 256.0,
                backgroundColor: const Color(0x4949B356),
                flexibleSpace: FlexibleSpaceBar(
                  background: RepaintBoundary(
                    child: Center(
                      child: currentState.headerImage.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : HeaderImageView(imageUrl: currentState.headerImage),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    MainExpansionSection(
                      key: const ValueKey("latest"),
                      title: "Latest movies",
                      initiallyExpanded: true,
                      movies: currentState.latestMovies,
                      // callback: () => togglePeriodicFetch(),
                    ),
                    MainExpansionSection(
                      key: const ValueKey("popular"),
                      title: "Popular movies",
                      initiallyExpanded: true,
                      movies: currentState.popularMovies,
                    ),
                    MainExpansionSection(
                      key: const ValueKey("top"),
                      title: "Top Rated movies",
                      movies: currentState.topRatedMovies,
                      callback: () => bloc.add(TopRatedEvent()),
                    ),
                    MainExpansionSection(
                      key: const ValueKey("upcoming"),
                      title: "Upcoming movies",
                      movies: currentState.upcomingMovies,
                      callback: () => bloc.add(UpcomingEvent()),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: MediaQuery.of(context).padding.bottom))
            ],
          ),
        );
      },
    );
  }
}
