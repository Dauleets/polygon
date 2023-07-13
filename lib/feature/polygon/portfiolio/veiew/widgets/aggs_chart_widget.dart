import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:polygontrade/common/theme/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/aggregates_models.dart';

class MyChartWidget extends StatelessWidget {
  final String startTime;
  final String endTime;
  final List<Result> chartData;

  const MyChartWidget({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.chartData,
  });

  @override
  Widget build(BuildContext context) {
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
                // Existing LineSeries
                LineSeries<Result, DateTime>(
                  dataSource: chartData,
                  color: AppColors.primary,
                  xValueMapper: (Result result, _) =>
                      DateTime.fromMillisecondsSinceEpoch(result.t),
                  yValueMapper: (Result result, _) => result.c,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.bottom,
                    labelPosition: ChartDataLabelPosition.inside,
                    useSeriesColor: true,
                    textStyle: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: AppColors.white, fontSize: 13),
                  ),
                  markerSettings: const MarkerSettings(
                    isVisible: true,
                    shape: DataMarkerType.verticalLine,
                    color: AppColors.primary,
                    borderColor: Colors.green,
                    borderWidth: 5,
                  ),
                  pointColorMapper: (Result result, _) {
                    if (result.c > result.o) {
                      return AppColors.primary;
                    } else if (result.c < result.o) {
                      return Colors.red;
                    } else {
                      return AppColors.textDark;
                    }
                  },
                  // xValueMapper: (Result result, _) =>
                  //     DateTime.fromMillisecondsSinceEpoch(result.t),
                  // yValueMapper: (Result result, _) => result.c,
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
