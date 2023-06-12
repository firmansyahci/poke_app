import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://pokeapi.co/api/v2';

  Future<Response> get({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    try {
      final res = await _dio.get(
        _baseUrl + path,
        queryParameters: data,
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
