import 'package:dartz/dartz.dart';
import 'package:polygontrade/feature/polygon/data/models/aggregates_models.dart';
import '../../../../common/error/failures.dart';
import '../../../../common/usecase/usecase.dart';
import '../../../../injection.dart';
import '../entity/aggregates_entity.dart';
import '../repository/repository.dart';

class FecthAggstoChartUseCase
    extends UseCase<AggregatesModels, AggregatesEntity> {
  final Repository repository = sl.get<Repository>();

  FecthAggstoChartUseCase();

  @override
  Future<Either<Failure, AggregatesModels>> call(
      [AggregatesEntity? params]) async {
    try {
      return await repository.getAggregatesModels(params!);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
