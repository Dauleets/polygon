import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../error/network_info.dart';

// Global constants
final mainUrl = dotenv.env['API_URL'];
final sharedPreferences = SharedPreferences.getInstance();
final dio = Dio()
  ..interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    compact: false,
  ));
final networkInfo = NetworkFailure();


// api path
