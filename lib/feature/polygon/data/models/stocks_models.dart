class StockModel {
  String ticker;
  String name;
  String market;
  String locale;
  String primaryExchange;
  String type;
  bool active;
  String currencyName;
  String cik;
  String compositeFigi;
  String shareClassFigi;
  DateTime lastUpdatedUtc;

  StockModel({
    required this.ticker,
    required this.name,
    required this.market,
    required this.locale,
    required this.primaryExchange,
    required this.type,
    required this.active,
    required this.currencyName,
    required this.cik,
    required this.compositeFigi,
    required this.shareClassFigi,
    required this.lastUpdatedUtc,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      ticker: json['ticker'],
      name: json['name'],
      market: json['market'],
      locale: json['locale'],
      primaryExchange: json['primary_exchange'],
      type: json['type'],
      active: json['active'],
      currencyName: json['currency_name'],
      cik: json['cik'],
      compositeFigi: json['composite_figi'],
      shareClassFigi: json['share_class_figi'],
      lastUpdatedUtc: DateTime.parse(json['last_updated_utc']),
    );
  }
}
