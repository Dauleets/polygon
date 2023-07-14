part of 'aggs_chart_bloc.dart';

abstract class AggsChartEvent extends Equatable {
  const AggsChartEvent();

  @override
  List<Object> get props => [];
}

class GetAggsChartEvent extends AggsChartEvent {
  final AggregatesEntity aggregatesEntity;

  const GetAggsChartEvent(this.aggregatesEntity);
}
