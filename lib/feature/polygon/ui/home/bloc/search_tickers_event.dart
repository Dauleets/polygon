part of 'search_tickers_bloc.dart';

abstract class SearchTickersEvent extends Equatable {
  const SearchTickersEvent();

  @override
  List<Object> get props => [];
}

class ValueToSearchTicketEvent extends SearchTickersEvent {
  final String tickets;

  const ValueToSearchTicketEvent(this.tickets);
}
