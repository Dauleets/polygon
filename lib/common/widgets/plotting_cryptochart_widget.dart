import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../feature/polygon/domain/entity/cryptodata_entity.dart';

class PlottingCryptoChartWidget extends StatelessWidget {
  final List<CryptoData> chartData;

  const PlottingCryptoChartWidget({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
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
