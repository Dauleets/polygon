import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polygontrade/feature/polygon/data/models/aggregates_models.dart';
import 'package:polygontrade/feature/polygon/domain/entity/aggregates_entity.dart';
import 'package:polygontrade/feature/polygon/domain/usecase/chart_agregates_usecase.dart';

part 'aggs_chart_event.dart';
part 'aggs_chart_state.dart';

// Блок управления состоянием графиков
class AggsChartBloc extends Bloc<AggsChartEvent, AggsChartState> {
  final FecthAggstoChartUseCase fecthAggstoChartUseCase =
      FecthAggstoChartUseCase();
  AggsChartBloc() : super(AggsChartInitial()) {
    on<GetAggsChartEvent>((event, emit) async {
      emit(AggsChartStateLoading());
      final studentsEither =
          await fecthAggstoChartUseCase.call(event.aggregatesEntity);
      studentsEither.fold(
        (failure) => emit(AggsChartStateError(failure.message)),
        (groupedDaily) => emit(AggsChartStateLoaded(groupedDaily)),
      );
    });
  }
}
