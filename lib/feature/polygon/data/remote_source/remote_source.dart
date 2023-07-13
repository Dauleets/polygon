import '../models/grouped_daily_models.dart';

abstract class RemoteDataSource {
  /// Calls the  endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<GroupedDailyModels> getAllGroupedDaily(String time);
}
