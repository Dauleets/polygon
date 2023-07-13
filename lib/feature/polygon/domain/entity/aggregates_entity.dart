import 'package:equatable/equatable.dart';

class AggregatesEntity extends Equatable {
  final String ticker;
  final int queryCount;
  final int resultsCount;
  final bool adjusted;
  final List<ResultEntity> results;
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

class ResultEntity extends Equatable {
  final double c;
  final double h;
  final double l;
  final int n;
  final double o;
  final int t;
  final double v;
  final double vw;

  const ResultEntity({
    required this.c,
    required this.h,
    required this.l,
    required this.n,
    required this.o,
    required this.t,
    required this.v,
    required this.vw,
  });

  @override
  List<Object?> get props => [c, h, l, n, o, t, v, vw];
}
