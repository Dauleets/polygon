class AggregatesModels {
  final String ticker;
  final int queryCount;
  final int resultsCount;
  final bool adjusted;
  final List<Result> results;
  final String status;
  final String requestId;
  final int count;

  AggregatesModels({
    required this.ticker,
    required this.queryCount,
    required this.resultsCount,
    required this.adjusted,
    required this.results,
    required this.status,
    required this.requestId,
    required this.count,
  });

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
    );
  }
}

class Result {
  final double c;
  final double h;
  final double l;
  final int n;
  final double o;
  final int t;
  final double v;
  final double vw;

  Result({
    required this.c,
    required this.h,
    required this.l,
    required this.n,
    required this.o,
    required this.t,
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
