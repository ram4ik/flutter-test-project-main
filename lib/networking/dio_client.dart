import 'package:dio/dio.dart';

class DioClient {
  final String apiBaseUrl;

  const DioClient({required this.apiBaseUrl});

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor());

    return dio;
  }
}
