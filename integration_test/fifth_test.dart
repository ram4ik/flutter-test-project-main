import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tmdb_test/presentation/main.dart' as app;

import '../pages/MainPage.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Data is fetched for third and fourth section only if user clicks to expand any of those sections", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    await tester.tap(MainPage.latestText);
    await tester.pump();

    await tester.tap(MainPage.popularText);
    await tester.pump();

    await tester.tap(MainPage.topText);
    await tester.pumpAndSettle();

    expect(find.text("The Godfather"), findsOneWidget);

    await tester.tap(MainPage.upcomingText);
    await tester.pumpAndSettle();

    expect(find.text("Morbius"), findsOneWidget);
  });


}