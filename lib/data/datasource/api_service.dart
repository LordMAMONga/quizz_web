import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService()
      : dio = Dio(
    BaseOptions(
      baseUrl: 'https://georgianne-unrejoiced-takingly.ngrok-free.dev',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'ngrok-skip-browser-warning': 'true',
      },
    ),
  );
}