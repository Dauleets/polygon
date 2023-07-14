import 'package:dartz/dartz.dart';
import 'package:polygontrade/feature/polygon/data/models/grouped_daily_models.dart';
import 'package:polygontrade/feature/polygon/data/models/stocks_models.dart';

import '../../../../common/error/failures.dart';
import '../../data/models/aggregates_models.dart';
import '../entity/aggregates_entity.dart';

abstract class Repository {
  Future<Either<Failure, GroupedDailyModels>> fetchAllGroupedDaily(String time);
  Future<Either<Failure, AggregatesModels>> getAggregatesModels(
      AggregatesEntity entity);
  Future<Either<Failure, List<StockModel>>> searchTickers(String ticker);
}
