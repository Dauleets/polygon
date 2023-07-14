import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/grouped_daily_models.dart';
import '../../../data/models/stocks_models.dart';
import '../../../domain/usecase/grouped_daily_usecase.dart';
import '../../../domain/usecase/search_widget_usecase.dart';

part 'grouped_daily_event.dart';
part 'grouped_daily_state.dart';

class GroupedDailyBloc extends Bloc<GroupedDailyEvent, GroupedDailyState> {
  final FecthGroupedDailyUseCase listStudentsUsecase =
      FecthGroupedDailyUseCase();
  final SearchUseCaseUseCase searchUseCaseUseCase = SearchUseCaseUseCase();

  GroupedDailyBloc() : super(GroupedDailyInitial()) {
    on<GetGroupedDailyEvent>((event, emit) async {
      emit(GroupedDailyStateLoading());
      final studentsEither = await listStudentsUsecase.call(event.time);
      studentsEither.fold(
        (failure) => emit(GroupedDailyStateError(failure.message)),
        (groupedDaily) => emit(GroupedDailyStateLoaded(groupedDaily)),
      );
    });
    on<ValueToSearchTicketEvent>((event, emit) async {
      emit(GroupedDailyStateLoading());
      final studentsEither = await searchUseCaseUseCase.call(event.tickets);
      studentsEither.fold(
        (failure) => emit(SearchTickersStateError(failure.message)),
        (groupedDaily) => emit(SearchTickersStateLoaded(groupedDaily)),
      );
    });
  }
}
