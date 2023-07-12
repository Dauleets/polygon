import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../feature/polygon/domain/entity/cryptodata_entity.dart';

class ChartStylingCryptoChart extends StatelessWidget {
  final List<CryptoData> chartData;

  const ChartStylingCryptoChart({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderColor: Colors.grey,
      plotAreaBackgroundColor: Colors.white,
      title: ChartTitle(text: 'Crypto Prices'),
      legend: const Legend(isVisible: true),
      primaryXAxis: DateTimeAxis(),
      series: <ChartSeries>[
        LineSeries<CryptoData, DateTime>(
          dataSource: chartData,
          xValueMapper: (CryptoData data, _) =>
              DateTime.fromMillisecondsSinceEpoch(data.time),
          yValueMapper: (CryptoData data, _) => data.close,
        ),
      ],
    );
  }
}
