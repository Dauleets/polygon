import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../error/network_info.dart';

// Global constants
final mainUrl = dotenv.env['API_URL'];
final networkInfo = NetworkFailure();


// api path
