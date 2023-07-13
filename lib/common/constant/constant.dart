import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../error/network_info.dart';

// Global constants
final mainUrl = dotenv.env['API_URL'];
final apiKey = dotenv.env['API_KEY'];
final sharedPreferences = SharedPreferences.getInstance();
final networkInfo = NetworkFailure();

// api path
const String getAllGroupedDailyUrl =
    'v2/aggs/grouped/locale/global/market/crypto/';
const String getAggsTickerUrl = 'v2/aggs/ticker/';
