import 'package:dartz/dartz.dart';
import 'package:polygontrade/feature/polygon/data/models/grouped_daily_models.dart';

import '../../../../common/error/failures.dart';

abstract class Repository {
  Future<Either<Failure, GroupedDailyModels>> fetchAllGroupedDaily(String time);
}
