part of 'search_tickers_bloc.dart';

abstract class SearchTickersState extends Equatable {
  const SearchTickersState();

  @override
  List<Object> get props => [];
}

class SearchTickersInitial extends SearchTickersState {}

class SearchTickersStateLoading extends SearchTickersState {}

class SearchTickersStateLoaded extends SearchTickersState {
  final List<StockModel> tickets;

  const SearchTickersStateLoaded(this.tickets);

  @override
  List<Object> get props => [tickets];
}

class SearchTickersStateError extends SearchTickersState {
  final String error;

  const SearchTickersStateError(this.error);

  @override
  List<Object> get props => [error];
}
