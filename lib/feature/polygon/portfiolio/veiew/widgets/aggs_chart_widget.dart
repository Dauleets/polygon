import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:polygontrade/common/theme/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/aggregates_models.dart';

class MyChartWidget extends StatelessWidget {
  final DateTime startTime;
  final DateTime endTime;
  final List<Result> chartData;

  MyChartWidget({
    required this.startTime,
    required this.endTime,
    required this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    return Container(
      height: 350,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: SfCartesianChart(
              plotAreaBorderColor: AppColors.colorLineGrey,
              plotAreaBackgroundColor: Colors.white,
              primaryXAxis: DateTimeAxis(
                minimum: startTime,
                maximum: endTime,
                labelRotation: -45,
                intervalType: DateTimeIntervalType.days,
              ),
              primaryYAxis: NumericAxis(
                minimum: calculateMinValue() - 1, // Adjusting min value
                maximum: calculateMaxValue() + 1, // Adjusting max value
                labelFormat: '{value} \$',
              ),
              tooltipBehavior: TooltipBehavior(
                enable: true,
                header: '',
                format: 'point.x: point.y \$',
                canShowMarker: false,
              ),
              series: <ChartSeries>[
                LineSeries<Result, DateTime>(
                  dataSource: chartData,
                  xValueMapper: (Result result, _) =>
                      DateTime.fromMillisecondsSinceEpoch(
                          int.parse(result.t.toString())),
                  yValueMapper: (Result result, _) => result.c,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HIGH:',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: AppColors.colorLigthGrey,
                                  fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        Text(
                          chartData[0].h.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: AppColors.textDark,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOW:',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 16,
                                color: AppColors.colorLigthGrey,
                              ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          chartData[0].l.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontSize: 16,
                                  color: AppColors.textDark,
                                  fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'OPEN:',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 16,
                                color: AppColors.colorLigthGrey,
                              ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          chartData[0].o.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontSize: 16,
                                  color: AppColors.textDark,
                                  fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CLOSE:',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 16,
                                color: AppColors.colorLigthGrey,
                              ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          chartData[0].c.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontSize: 16,
                                  color: AppColors.textDark,
                                  fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double calculateMinValue() {
    double minValue = double.infinity;
    for (var result in chartData) {
      if (result.l < minValue) {
        minValue = result.l;
      }
    }
    return minValue;
  }

  double calculateMaxValue() {
    double maxValue = double.negativeInfinity;
    for (var result in chartData) {
      if (result.h > maxValue) {
        maxValue = result.h;
      }
    }
    return maxValue;
  }
}
