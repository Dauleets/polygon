class GroupedDailyModels {
  final int queryCount;
  final int resultsCount;
  final bool adjusted;
  final List<Result> results;
  final String status;
  final String requestId;
  final int count;

  GroupedDailyModels({
    required this.queryCount,
    required this.resultsCount,
    required this.adjusted,
    required this.results,
    required this.status,
    required this.requestId,
    required this.count,
  });

  factory GroupedDailyModels.fromJson(Map<String, dynamic> json) {
    List<dynamic> resultsJson = json['results'];
    List<Result> results =
        resultsJson.map((resultJson) => Result.fromJson(resultJson)).toList();

    return GroupedDailyModels(
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
  final String t;
  final double c;
  final double h;
  final double l;
  final int n;
  final double o;
  final String tTimestamp; // Change the type to String
  final double v;
  final double vw;

  Result({
    required this.t,
    required this.c,
    required this.h,
    required this.l,
    required this.n,
    required this.o,
    required this.tTimestamp,
    required this.v,
    required this.vw,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      t: json['T'],
      v: (json['v'] as num?)?.toDouble() ?? 0.0,
      vw: (json['vw'] as num?)?.toDouble() ?? 0.0,
      o: json['o'].toDouble(),
      c: json['c'].toDouble(),
      h: json['h'].toDouble(),
      l: json['l'].toDouble(),
      tTimestamp: json['t'].toString(),
      n: json['n'],
    );
  }
}
