import 'package:polygontrade/feature/polygon/data/models/stocks_models.dart';
import 'package:polygontrade/feature/polygon/domain/entity/aggregates_entity.dart';

import '../models/aggregates_models.dart';
import '../models/grouped_daily_models.dart';

abstract class RemoteDataSource {
  /// Calls the  endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<GroupedDailyModels> getAllGroupedDaily(String time);

  /// Calls the  endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<AggregatesModels> getAggregatesModels(AggregatesEntity entity);

  /// Calls the  endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<StockModel>> searchTickers(String ticker);
}
