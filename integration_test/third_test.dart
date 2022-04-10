import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tmdb_test/presentation/main.dart' as app;

import '../pages/MainPage.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("The first two sections are populated when user lands on the Main screen keeping other two in collapsed state but showing the section titles.", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text("Turning Red").first, findsOneWidget);

    expect(find.text("Turning Red").last, findsOneWidget);

    await tester.tap(MainPage.latestText);
    await tester.pump();

    await tester.pumpAndSettle();
    expect(find.text("Moonfall").first, findsOneWidget);

    await tester.tap(MainPage.latestText);
    await tester.pump();
    await tester.tap(MainPage.popularText);
    await tester.pump();

    await tester.pumpAndSettle();
    expect(find.text("Moonfall").first, findsOneWidget);
  });

}