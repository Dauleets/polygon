part of 'grouped_daily_bloc.dart';

abstract class GroupedDailyEvent extends Equatable {
  const GroupedDailyEvent();

  @override
  List<Object> get props => [];
}

class GetGroupedDailyEvent extends GroupedDailyEvent {
  final String time;

  const GetGroupedDailyEvent(this.time);
}

class ValueToSearchTicketEvent extends GroupedDailyEvent {
  final String tickets;

  const ValueToSearchTicketEvent(this.tickets);
}
