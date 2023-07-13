import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/constant/constant.dart';
import 'common/error/failures.dart';
import 'common/error/network_info.dart';
import 'feature/polygon/data/remote_source/remote_source.dart';
import 'feature/polygon/data/remote_source/remote_source_impl.dart';
import 'feature/polygon/data/repository/repository_impl.dart';
import 'feature/polygon/domain/repository/repository.dart';
import 'feature/polygon/home/bloc/grouped_daily_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => GroupedDailyBloc());

  // UseCase
  // sl.registerLazySingleton(() => SignUpUsecase());

  // DataSource
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  // Repository
  sl.registerLazySingleton<Repository>(() => RepositoryImpl());

  // Local Data Sources
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Remote Data Sources
  final Dio dio = Dio(BaseOptions(
    baseUrl: '$mainUrl',
  ));

  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<Failure>(() => NetworkFailure());

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      options.headers["Content-Type"] =
          "application/json"; // Set the appropriate content-type
      return handler.next(options);
    },
    onError: (e, handler) {},
  ));

  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    compact: false,
  ));

  // Logging requests in Debug mode
  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(
        responseBody: true, requestBody: true, logPrint: _logEvent));
  }
}

_logEvent(Object? object) {
  var pattern = RegExp('.{1,800}');
  pattern.allMatches(object.toString()).forEach((match) {
    if (kDebugMode) {
      print(match.group(0));
    }
  });
}
