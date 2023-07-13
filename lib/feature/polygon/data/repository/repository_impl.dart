import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../../common/error/exception.dart';
import '../../../../../common/error/failures.dart';
import '../../../../../common/error/network_info.dart';
import '../../domain/entity/aggregates_entity.dart';
import '../../domain/repository/repository.dart';
import '../models/aggregates_models.dart';
import '../models/grouped_daily_models.dart';
import '../remote_source/remote_source.dart';
import '../remote_source/remote_source_impl.dart';

class RepositoryImpl implements Repository {
  final Connectivity connectivity = Connectivity();
  final RemoteDataSource loginRemoteDataSource = RemoteDataSourceImpl();

  Future<void> _checkConnectivity() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      if (kDebugMode) {
        print('offline');
      }
      throw NetworkException();
    }
  }

  @override
  Future<Either<Failure, GroupedDailyModels>> fetchAllGroupedDaily(
      String time) async {
    try {
      await _checkConnectivity();
      final groupedDaily = await loginRemoteDataSource.getAllGroupedDaily(time);
      return Right(groupedDaily);
    } on ServerException catch (error) {
      return Left(ServerFailure(statusCode: error.response.statusCode));
    } on NetworkException {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, AggregatesModels>> getAggregatesModels(
      AggregatesEntity entity) async {
    try {
      await _checkConnectivity();
      final agregatesModels =
          await loginRemoteDataSource.getAggregatesModels(entity);
      return Right(agregatesModels);
    } on ServerException catch (error) {
      return Left(ServerFailure(statusCode: error.response.statusCode));
    } on NetworkException {
      return Left(NetworkFailure());
    }
  }
}
