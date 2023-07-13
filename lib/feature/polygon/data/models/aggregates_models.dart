import '../../domain/entity/aggregates_entity.dart';

class AggregatesModels extends AggregatesEntity {
  const AggregatesModels({
    required String ticker,
    required int queryCount,
    required int resultsCount,
    required bool adjusted,
    required List<Result> results,
    required String status,
    required String requestId,
    required int count,
    String? time,
  }) : super(
          ticker: ticker,
          queryCount: queryCount,
          resultsCount: resultsCount,
          adjusted: adjusted,
          results: results,
          status: status,
          requestId: requestId,
          count: count,
          time: time,
        );

  factory AggregatesModels.fromJson(Map<String, dynamic> json) {
    List<dynamic> resultsJson = json['results'];
    List<Result> results =
        resultsJson.map((resultJson) => Result.fromJson(resultJson)).toList();

    return AggregatesModels(
      ticker: json['ticker'],
      queryCount: json['queryCount'],
      resultsCount: json['resultsCount'],
      adjusted: json['adjusted'],
      results: results,
      status: json['status'],
      requestId: json['request_id'],
      count: json['count'],
      time: json[
          'time'], // Assign the value of time from JSON to the time parameter
    );
  }
}

class Result {
  final int t; // Updated type to int
  final double c;
  final double h;
  final double l;
  final int n;
  final double o;
  final double v;
  final double vw;

  Result({
    required this.t,
    required this.c,
    required this.h,
    required this.l,
    required this.n,
    required this.o,
    required this.v,
    required this.vw,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      c: json['c'].toDouble(),
      h: json['h'].toDouble(),
      l: json['l'].toDouble(),
      n: json['n'],
      o: json['o'].toDouble(),
      t: json['t'],
      v: json['v'].toDouble(),
      vw: json['vw'].toDouble(),
    );
  }
}
