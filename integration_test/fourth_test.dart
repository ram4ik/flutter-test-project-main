import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tmdb_test/presentation/features/movies/view/movie_card.dart';
import 'package:flutter_tmdb_test/presentation/features/movies/view/movies_expansion_section.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tmdb_test/presentation/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Each item in the horizontal list have movie image and the movie title", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(MainCard).first, findsOneWidget);

    expect(find.byType(MainExpansionSection).first, findsOneWidget);

    var finder = find.byType(MainExpansionSection).first;
    if (kDebugMode) {
      print(finder.evaluate().first);
    }

    var widget = finder.evaluate().single.widget as MainExpansionSection;
    if (kDebugMode) {
      print(widget.title);
    }

    expect(widget.title, equals("Latest movies"));

    if (kDebugMode) {
      print(widget.movies);
    }

    // Each item in the horizontal list
    for (var movie in widget.movies) {

      // has movie title
      if (kDebugMode) {
        print(movie.title);
      }
      expect(movie.title!.isNotEmpty, true);

      if (kDebugMode) {
        print(movie.originalTitle);
      }

      // has movie image
      if (kDebugMode) {
        print(movie.posterPath);
      }
      expect(movie.posterPath!.isNotEmpty, true);
    }
  });

}