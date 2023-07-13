import 'package:equatable/equatable.dart';

import '../../data/models/aggregates_models.dart';

class AggregatesEntity extends Equatable {
  final String ticker;
  final int queryCount;
  final int resultsCount;
  final bool adjusted;
  final List<Result> results;
  final String status;
  final String requestId;
  final int count;
  final String? time; // Optional time parameter

  const AggregatesEntity({
    required this.ticker,
    required this.queryCount,
    required this.resultsCount,
    required this.adjusted,
    required this.results,
    required this.status,
    required this.requestId,
    required this.count,
    this.time, // Add optional time parameter
  });

  @override
  List<Object?> get props => [
        ticker,
        queryCount,
        resultsCount,
        adjusted,
        results,
        status,
        requestId,
        count,
        time,
      ];
}
