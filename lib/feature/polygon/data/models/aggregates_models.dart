class AggregatesModels {
  final String ticker;
  final int queryCount;
  final int resultsCount;
  final bool adjusted;
  final List<TickerResult> results;
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
    List<TickerResult> results = resultsJson
        .map((resultJson) => TickerResult.fromJson(resultJson))
        .toList();

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

class TickerResult {
  final double v;
  final double vw;
  final double o;
  final double c;
  final double h;
  final double l;
  final int tTimestamp;
  final int n;

  TickerResult({
    required this.v,
    required this.vw,
    required this.o,
    required this.c,
    required this.h,
    required this.l,
    required this.tTimestamp,
    required this.n,
  });

  factory TickerResult.fromJson(Map<String, dynamic> json) {
    return TickerResult(
      v: json['v'],
      vw: json['vw'],
      o: json['o'],
      c: json['c'],
      h: json['h'],
      l: json['l'],
      tTimestamp: json['t'],
      n: json['n'],
    );
  }
}
