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
      emit(GroupedDailyStateLoading()); // Изменение состояния на "загрузка"
      final studentsEither = await listStudentsUsecase.call(event.time);
      studentsEither.fold(
        (failure) => emit(GroupedDailyStateError(failure
            .message)), // Изменение состояния на "ошибка" при неудачном запросе
        (groupedDaily) => emit(GroupedDailyStateLoaded(
            groupedDaily)), // Изменение состояния на "загружено" при успешном запросе
      );
    });
    on<ValueToSearchTicketEvent>((event, emit) async {
      emit(GroupedDailyStateLoading()); // Изменение состояния на "загрузка"
      final studentsEither = await searchUseCaseUseCase.call(event.tickets);
      studentsEither.fold(
        (failure) => emit(SearchTickersStateError(failure
            .message)), // Изменение состояния на "ошибка" при неудачном запросе поиска
        (groupedDaily) => emit(SearchTickersStateLoaded(
            groupedDaily)), // Изменение состояния на "загружено" при успешном запросе поиска
      );
    });
  }
}
