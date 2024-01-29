import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiHost {
  static late String apiHostUrl;

  static Future<void> loadApiHostUrl() async {
    await dotenv.load();
    apiHostUrl = dotenv.env['API_HOST'] ?? '';
  }
}

class API {
  static Future<Map<String, dynamic>> _request(String url, String method,
      {Map<String, dynamic>? body}) async {
    final options = Options(
      headers: {
        "Content-Type": "application/json",
      },
    );

    // Ambil token dari tempat penyimpanan token Anda
    // final token = GetStorage().read('token') ?? '';
    const token = '';

    if (token.isNotEmpty) {
      options.headers!['Authorization'] = 'Bearer $token';
    }

    late Response response;
    late Map<String, dynamic> data;

    try {
      switch (method) {
        case 'GET':
          response = await Dio().get(url, options: options);
          break;
        case 'POST':
          response = await Dio().post(url, options: options, data: body);
          break;
        case 'PUT':
          response = await Dio().put(url, options: options, data: body);
          break;
        case 'DELETE':
          response = await Dio().delete(url, options: options);
          break;
        default:
          throw Exception('Invalid HTTP method');
      }

      final status = response.statusCode;

      if (status == 200) {
        data = {
          'success': true,
          'message': 'success',
          'data': response.data,
        };
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      data = {
        'success': false,
        'message': 'failed',
      };
    }
    return data;
  }

  static Future<Map<String, dynamic>> get(String url) async {
    return _request(url, 'GET');
  }

  static Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> body) async {
    return _request(url, 'POST', body: body);
  }

  static Future<Map<String, dynamic>> put(
      String url, Map<String, dynamic> body) async {
    return _request(url, 'PUT', body: body);
  }

  static Future<Map<String, dynamic>> delete(String url,
      {Map<String, dynamic>? body}) async {
    return _request(url, 'DELETE', body: body);
  }
}
