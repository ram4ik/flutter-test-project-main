import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tmdb_test/presentation/main.dart' as app;

import '../pages/MainPage.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("User is be able to collapse, expanded section and vice versa from the section title bar", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(MainPage.latestText, findsOneWidget);
    await tester.tap(MainPage.latestText);
    await tester.pump();

    expect(MainPage.popularText, findsOneWidget);
    await tester.tap(MainPage.popularText);
    await tester.pump();

    expect(MainPage.topText, findsOneWidget);
    await tester.tap(MainPage.topText);
    await tester.pump();
    await tester.tap(MainPage.topText);
    await tester.pump();

    expect(MainPage.upcomingText, findsOneWidget);
    await tester.tap(MainPage.upcomingText);
    await tester.pump();
    await tester.tap(MainPage.upcomingText);
    await tester.pump();

  });

}