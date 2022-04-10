import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tmdb_test/presentation/features/movies/view/header_image.dart';
import 'package:flutter_tmdb_test/presentation/features/movies/view/movies_expansion_section.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tmdb_test/presentation/main.dart' as app;

import '../pages/MainPage.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  String headerImage;

  testWidgets("Vertical List with collapsible toolbar, with first image from popular movies", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(CircularProgressIndicator), findsNothing);

    expect(find.byType(SliverAppBar), findsOneWidget);
    expect(find.byType(HeaderImageView), findsOneWidget);

    var headerImageView = find.byType(HeaderImageView).first;
    var imageView = headerImageView.evaluate().single.widget as HeaderImageView;

    headerImage = imageView.imageUrl;
    expect(headerImage.isNotEmpty, true);

    expect(find.byType(SliverList).first, findsOneWidget);

    await tester.tap(MainPage.latestText);
    await tester.pump();

    var popular = find.byType(MainExpansionSection).first;
    var popularMoviesSection = popular.evaluate().single.widget as MainExpansionSection;

    for(var movie in popularMoviesSection.movies) {
      if (kDebugMode) {
        print(headerImage.split('/').last);
      }
      if (kDebugMode) {
        print(movie.posterPath?.split('/').last);
      }
      expect(headerImage.split('/').last, equals(movie.posterPath?.split('/').last));
      break;
    }
  });

}