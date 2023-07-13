import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:polygontrade/common/theme/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/aggregates_models.dart';

class MyChartWidget extends StatelessWidget {
  final String startTime;
  final String endTime;
  final List<Result> chartData;

  MyChartWidget({
    required this.startTime,
    required this.endTime,
    required this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    void calculateTrendlinePoints() {
      // Calculate the trendline using the points in chartData
      // Example: Linear Regression
      int n = chartData.length;
      double sumX = 0;
      double sumY = 0;
      double sumXY = 0;
      double sumXX = 0;

      for (var point in chartData) {
        sumX += point.t.toDouble();
        sumY += point.c;
        sumXY += point.t.toDouble() * point.c;
        sumXX += point.t.toDouble() * point.t.toDouble();
      }

      double slope = (n * sumXY - sumX * sumY) / (n * sumXX - sumX * sumX);
      double intercept = (sumY - slope * sumX) / n;

      // Generate the trendline points
      double startX = chartData.first.t.toDouble();
      double endX = chartData.last.t.toDouble();
      double startY = slope * startX + intercept;
      double endY = slope * endX + intercept;

      // Add trendline annotation
      chartData.add(Result(
        t: startX.toInt(),
        c: startY,
        l: chartData[0].l,
        h: chartData[0].h,
        n: chartData[0].n,
        o: chartData[0].o,
        v: chartData[0].v,
        vw: chartData[0].vw,
      ));
      chartData.add(Result(
        t: endX.toInt(),
        c: startY,
        l: chartData[0].l,
        h: chartData[0].h,
        n: chartData[0].n,
        o: chartData[0].o,
        v: chartData[0].v,
        vw: chartData[0].vw,
      ));
    }

    DateFormat dateFormat = DateFormat('MMM-dd');
    return Container(
      height: 330,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: SfCartesianChart(
              plotAreaBorderColor: AppColors.colorLineGrey,
              plotAreaBackgroundColor: Colors.white,
              primaryXAxis: DateTimeAxis(
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(width: 0),
                majorGridLines: const MajorGridLines(width: 0),
                dateFormat: dateFormat,
                minimum: DateTime.parse(startTime),
                maximum: DateTime.parse(endTime),
              ),
              primaryYAxis: NumericAxis(
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(width: 0),
                majorGridLines: const MajorGridLines(
                  width: 2,
                  color: Color.fromRGBO(238, 243, 245, 1),
                ),
                minimum: calculateMinValue() - 1, // Adjusting min value
                maximum: calculateMaxValue() + 3, // Adjusting max value
                labelFormat: '{value}',
                labelStyle: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColors.colorLigthGrey),
              ),
              selectionType: SelectionType.point,
              tooltipBehavior: TooltipBehavior(
                enable: true,
                elevation: 0,
                color: AppColors.primary,
                textStyle: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColors.white),
                header: '',
                format: 'point.x: point.y \$',
                canShowMarker: false,
              ),
              series: <ChartSeries>[
                // LineSeries
                LineSeries<Result, DateTime>(
                  dataSource: chartData,
                  color: AppColors.primary,
                  pointColorMapper: (_, __) => AppColors.primary,
                  xValueMapper: (Result result, _) =>
                      DateTime.fromMillisecondsSinceEpoch(result.t),
                  yValueMapper: (Result result, _) => result.c,
                ),
              ],
              annotations: <CartesianChartAnnotation>[
                // Trendline annotation
                CartesianChartAnnotation(
                  widget: Container(
                    width: 1,
                    height: 100,
                    color: Colors.blue,
                  ),
                  coordinateUnit: CoordinateUnit.point,
                  x: DateTime.fromMillisecondsSinceEpoch(chartData.last.t),
                  y: chartData.last.c,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        const SizedBox(width: 10),
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
                        const SizedBox(width: 10),
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
                        const SizedBox(width: 10),
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
                        const SizedBox(width: 10),
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
