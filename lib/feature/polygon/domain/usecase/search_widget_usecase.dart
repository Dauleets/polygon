import 'package:dartz/dartz.dart';

import '../../../../common/error/failures.dart';
import '../../../../common/usecase/usecase.dart';
import '../../../../injection.dart';
import '../../data/models/stocks_models.dart';
import '../repository/repository.dart';

class SearchUseCaseUseCase extends UseCase<List<StockModel>, String> {
  final Repository repository = sl.get<Repository>();

  SearchUseCaseUseCase();

  @override
  Future<Either<Failure, List<StockModel>>> call([String? params]) async {
    try {
      return await repository.searchTickers(params!);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
