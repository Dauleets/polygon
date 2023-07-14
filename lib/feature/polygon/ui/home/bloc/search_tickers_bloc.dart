import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polygontrade/feature/polygon/data/models/stocks_models.dart';
import 'package:polygontrade/feature/polygon/domain/usecase/search_widget_usecase.dart';

part 'search_tickers_event.dart';
part 'search_tickers_state.dart';

class SearchTickersBloc extends Bloc<SearchTickersEvent, SearchTickersState> {
  final SearchUseCaseUseCase searchUseCaseUseCase = SearchUseCaseUseCase();
  SearchTickersBloc() : super(SearchTickersInitial()) {
    on<ValueToSearchTicketEvent>((event, emit) async {
      emit(SearchTickersStateLoading());
      final studentsEither = await searchUseCaseUseCase.call(event.tickets);
      studentsEither.fold(
        (failure) => emit(SearchTickersStateError(failure.message)),
        (groupedDaily) => emit(SearchTickersStateLoaded(groupedDaily)),
      );
    });
  }
}
