import '../../domain/entity/aggregates_entity.dart';

class AggregatesModels extends AggregatesEntity {
  const AggregatesModels({
    required String ticker,
    required int queryCount,
    required int resultsCount,
    required bool adjusted,
    required List<ResultEntity> results,
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
    List<ResultEntity> results =
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

class Result extends ResultEntity {
  // final double c;
  // final double h;
  // final double l;
  // final int n;
  // final double o;
  // final int t;
  // final double v;
  // final double vw;

  const Result({
    required double c,
    required double h,
    required double l,
    required int n,
    required double o,
    required int t,
    required double v,
    required double vw,
  }) : super(
          c: c,
          h: h,
          l: l,
          n: n,
          o: o,
          t: t,
          v: v,
          vw: vw,
        );

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
