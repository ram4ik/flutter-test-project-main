import 'package:flutter/material.dart';
import 'package:flutter_tmdb_test/domain/models/movies_model.dart';
import 'package:flutter_tmdb_test/networking/network_config.dart';
import 'package:flutter_tmdb_test/presentation/features/movies/view/movie_card.dart';
import 'package:flutter_tmdb_test/utils/dimes.dart';

class MainExpansionSection extends StatelessWidget {
  final String title;
  final bool initiallyExpanded;
  final List<MoviesResultModel> movies;
  final VoidCallback? callback;

  const MainExpansionSection({
    Key? key,
    required this.title,
    this.initiallyExpanded = false,
    required this.movies,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimens.spacing8),
      child: RepaintBoundary(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.radius8),
          child: ExpansionTile(
            title: Text(title),
            maintainState: true,
            backgroundColor: Colors.white,
            initiallyExpanded: initiallyExpanded,
            collapsedBackgroundColor: Colors.white,
            onExpansionChanged: (expanding) => {
              if (callback != null) {callback!()}
            },
            children: [
              SizedBox(
                height: 178.0,
                child: movies.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => MainCard(
                          key: ValueKey(movies[index].id!),
                          id: movies[index].id!,
                          url: "${NetworkConfig.imageBaseUrl}${movies[index].posterPath}",
                          title: movies[index].title!,
                          isFirst: index == 0,
                          isLast: index == movies.length - 1,
                        ),
                        itemCount: movies.length,
                      ),
              ),
              // To have the horizontal scrollbar overscroll glow on Android properly aligned
              const SizedBox(height: Dimens.spacing16)
            ],
          ),
        ),
      ),
    );
  }
}
