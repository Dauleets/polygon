part of 'aggs_chart_bloc.dart';

abstract class AggsChartState extends Equatable {
  const AggsChartState();

  @override
  List<Object> get props => [];
}

class AggsChartInitial extends AggsChartState {}

class AggsChartStateLoading extends AggsChartState {}

class AggsChartStateLoaded extends AggsChartState {
  final AggregatesModels groupedDailyState;

  const AggsChartStateLoaded(this.groupedDailyState);

  @override
  List<Object> get props => [groupedDailyState];
}

class AggsChartStateError extends AggsChartState {
  final String error;

  const AggsChartStateError(this.error);

  @override
  List<Object> get props => [error];
}
