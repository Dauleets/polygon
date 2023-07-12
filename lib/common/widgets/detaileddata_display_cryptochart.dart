import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../feature/polygon/domain/entity/cryptodata_entity.dart';

class DetailedDataDisplayCryptoChartWidget extends StatelessWidget {
  final List<CryptoData> chartData;

  const DetailedDataDisplayCryptoChartWidget(
      {super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(),
      trackballBehavior: TrackballBehavior(
        enable: true,
        markerSettings: const TrackballMarkerSettings(color: Colors.red),
        builder: (BuildContext context, TrackballDetails trackballDetails) {
          final CryptoData data =
              chartData[trackballDetails.pointIndex!.toInt()];

          return Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Time: ${data.time}'),
                Text('Open: ${data.open}'),
                Text('Close: ${data.close}'),
                Text('High: ${data.high}'),
                Text('Low: ${data.low}'),
              ],
            ),
          );
        },
      ),
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
