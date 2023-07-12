import 'package:dio/dio.dart';

class ServerException implements Exception {
  final Response response;
  ServerException({required this.response});
}

class NetworkException implements Exception {}
