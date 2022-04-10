import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tmdb_test/presentation/main.dart' as app;

import '../pages/MainPage.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Vertical list has 4 collapsible sections, each with title and horizontally scrollable list", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(MainPage.latest, findsOneWidget);
    expect(MainPage.popular, findsOneWidget);
    expect(MainPage.top, findsOneWidget);

    expect(MainPage.latestText, findsOneWidget);
    expect(MainPage.popularText, findsOneWidget);
    expect(MainPage.topText, findsOneWidget);

    await tester.tap(MainPage.latestText);
    await tester.pump();

    await tester.tap(MainPage.popularText);
    await tester.pump();

    await tester.pumpAndSettle();
    expect(MainPage.upcoming, findsOneWidget);
    expect(MainPage.upcomingText, findsOneWidget);
  });

}