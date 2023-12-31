part of 'grouped_daily_bloc.dart';

abstract class GroupedDailyState extends Equatable {
  const GroupedDailyState();

  @override
  List<Object> get props => [];
}

class GroupedDailyInitial extends GroupedDailyState {}

class GroupedDailyStateLoading extends GroupedDailyState {}

class GroupedDailyStateLoaded extends GroupedDailyState {
  final GroupedDailyModels groupedDailyState;

  const GroupedDailyStateLoaded(this.groupedDailyState);

  @override
  List<Object> get props => [groupedDailyState];
}

class GroupedDailyStateError extends GroupedDailyState {
  final String error;

  const GroupedDailyStateError(this.error);

  @override
  List<Object> get props => [error];
}

class SearchTickersStateLoaded extends GroupedDailyState {
  final List<StockModel> tickets;

  const SearchTickersStateLoaded(this.tickets);

  @override
  List<Object> get props => [tickets];
}

class SearchTickersStateError extends GroupedDailyState {
  final String error;

  const SearchTickersStateError(this.error);

  @override
  List<Object> get props => [error];
}
