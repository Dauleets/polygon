import 'package:dio/dio.dart';
import 'package:polygontrade/feature/polygon/data/remote_source/remote_source.dart';

import '../../../../common/constant/constant.dart';
import '../../../../common/error/exception.dart';
import '../../../../common/error/failures.dart';
import '../../../../injection.dart';
import '../../domain/entity/aggregates_entity.dart';
import '../models/aggregates_models.dart';
import '../models/grouped_daily_models.dart';
import '../models/stocks_models.dart';

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
    } on DioException catch (exception) {
      throw ServerException(response: exception.response!);
    } catch (_) {
      throw NetworkException();
    }
  }

  @override
  Future<AggregatesModels> getAggregatesModels(AggregatesEntity entity) async {
    try {
      final response = await dio.get(
        '${mainUrl!}$getAggsTickerUrl${entity.ticker}/range/1/day/${entity.time}/${entity.time}?adjusted=true&sort=asc&limit=120&apiKey=${apiKey!}',
      );

      if (response.statusCode == 200) {
        final aggregatesModels = AggregatesModels.fromJson(response.data);
        return aggregatesModels;
      } else {
        throw ServerFailure(statusCode: response.statusCode);
      }
    } on DioException catch (exception) {
      throw ServerException(response: exception.response!);
    } catch (_) {
      throw NetworkException();
    }
  }

  @override
  Future<List<StockModel>> searchTickers(String ticker) async {
    try {
      final response = await dio.get(
        '${mainUrl!}$serachTickersUrl$ticker&active=true&apiKey=$apiKey',
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;
        final List<dynamic> results = jsonData['results'];

        List<StockModel> stockList = results.map((json) {
          return StockModel.fromJson(json);
        }).toList();

        return stockList;
      } else {
        throw ServerFailure(statusCode: response.statusCode);
      }
    } on DioException catch (exception) {
      throw ServerException(response: exception.response!);
    } catch (_) {
      throw NetworkException();
    }
  }
}
