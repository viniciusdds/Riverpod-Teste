import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService()
     : dio = Dio(
    BaseOptions(
      baseUrl: 'https://clients.eadiaurora.com.br/MyCMS/clienteAG',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  ){


    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true
      )
    );

  }

}

