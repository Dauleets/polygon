import 'package:dio/dio.dart';
import 'package:polygontrade/feature/polygon/data/remote_source/remote_source.dart';

import '../../../../common/constant/constant.dart';
import '../../../../common/error/exception.dart';
import '../../../../common/error/failures.dart';
import '../../../../injection.dart';
import '../../domain/entity/aggregates_entity.dart';
import '../models/aggregates_models.dart';
import '../models/grouped_daily_models.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio = sl.get<Dio>();

  @override
  Future<GroupedDailyModels> getAllGroupedDaily(String time) async {
    try {
      final response = await dio.get(
        '$mainUrl$getAllGroupedDailyUrl$time?&apiKey=$apiKey',
      );

      if (response.statusCode == 200) {
        final groupedDailyModels = GroupedDailyModels.fromJson(response.data);
        return groupedDailyModels;
      } else {
        throw ServerFailure(statusCode: response.statusCode);
      }
    } on DioError catch (exception) {
      throw ServerException(response: exception.response!);
    } catch (_) {
      throw NetworkException();
    }
  }

  @override
  Future<AggregatesModels> getAggregatesModels(AggregatesEntity entity) async {
    try {
      final response = await dio.get(
        mainUrl! +
            getAggsTickerUrl +
            '${entity.ticker}' +
            '/range/1/day/' +
            '${entity.time}/' +
            '${entity.time}' +
            '?adjusted=true&sort=asc&limit=120&apiKey=' +
            apiKey!,
      );

      if (response.statusCode == 200) {
        final aggregatesModels = AggregatesModels.fromJson(response.data);
        return aggregatesModels;
      } else {
        print(response.statusCode);
        throw ServerFailure(statusCode: response.statusCode);
      }
    } on DioError catch (exception) {
      print(exception);
      throw ServerException(response: exception.response!);
    } catch (_) {
      print(_);
      throw NetworkException();
    }
  }
}
