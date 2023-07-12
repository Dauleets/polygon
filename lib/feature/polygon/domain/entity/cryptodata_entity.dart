import 'package:equatable/equatable.dart';

class CryptoData extends Equatable {
  const CryptoData({
    required this.time,
    required this.open,
    required this.close,
    required this.high,
    required this.low,
  });

  final double open;
  final double close;
  final double high;
  final double low;
  final int time;

  @override
  List<Object?> get props => [time, open, close, high, low];
}
