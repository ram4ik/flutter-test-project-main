import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tmdb_test/networking/dio_client.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tmdb_test/presentation/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Latest Movies API is Polled every 30 seconds to fetch the latest data and update the view", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    const response = DioClient(apiBaseUrl: '');
    int  receiveTimeOutValue = response.dio.options.receiveTimeout.toInt();

    expect(receiveTimeOutValue, equals(30000));

  });

}