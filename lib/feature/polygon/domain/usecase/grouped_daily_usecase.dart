import 'package:dartz/dartz.dart';

import '../../../../common/error/failures.dart';
import '../../../../common/usecase/usecase.dart';
import '../../../../injection.dart';
import '../../data/models/grouped_daily_models.dart';
import '../repository/repository.dart';

class FecthGroupedDailyUseCase extends UseCase<GroupedDailyModels, String> {
  final Repository repository = sl.get<Repository>();

  FecthGroupedDailyUseCase();

  @override
  Future<Either<Failure, GroupedDailyModels>> call([String? params]) async {
    try {
      return await repository.fetchAllGroupedDaily(params!);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
