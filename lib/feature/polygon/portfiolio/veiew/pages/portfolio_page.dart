import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:polygontrade/feature/polygon/portfiolio/bloc/aggs_chart_bloc.dart';
import 'package:polygontrade/feature/polygon/portfiolio/veiew/widgets/aggs_chart_widget.dart';
import '../../../../../common/theme/colors.dart';
import '../../../../../common/widgets/loading.dart';
import '../../../data/models/aggregates_models.dart';
import '../../../domain/entity/aggregates_entity.dart';

class PortFolioPage extends StatelessWidget {
  final String ticker;
  const PortFolioPage({super.key, required this.ticker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        titleTextStyle: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(fontWeight: FontWeight.w400),
        title: Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Text(
            ticker,
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset('assets/icon/back.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icon/search.svg'),
            onPressed: () {},
          ),
          const SizedBox(width: 15)
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const SizedBox(height: 22),

              // DetailedDataDisplayCryptoChartWidget(chartData: []),
              DateTabBarChartsWidget(ticker: ticker),
              const LineGreyPorftolioWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class DateTabBarChartsWidget extends StatefulWidget {
  final String ticker;
  const DateTabBarChartsWidget({super.key, required this.ticker});

  @override
  State<DateTabBarChartsWidget> createState() => _DateTabBarChartsWidgetState();
}

class _DateTabBarChartsWidgetState extends State<DateTabBarChartsWidget>
    with SingleTickerProviderStateMixin {
  late AggsChartBloc bloc;
  late TabController tabController;

  late AggregatesEntity fecthOneDayAgoFormatted;
  late AggregatesEntity fecthFiveDaysAgoFormatted;
  late AggregatesEntity fecthOneWeekAgoFormatted;
  late AggregatesEntity fecthOneMonthAgoFormatted;
  late AggregatesEntity fecthThreeMonthsAgoFormatted;
  late List<AggregatesEntity> listEntity;
  Future<void> _refreshData() async {
    DateTime currentDate = DateTime.now();

    DateTime oneDayAgo = currentDate.subtract(const Duration(days: 2));
    DateTime fiveDaysAgo = currentDate.subtract(const Duration(days: 5));
    DateTime oneWeekAgo = currentDate.subtract(const Duration(days: 7));
    DateTime oneMonthAgo =
        DateTime(currentDate.year, currentDate.month - 1, currentDate.day);
    DateTime threeMonthsAgo =
        DateTime(currentDate.year, currentDate.month - 3, currentDate.day);

    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    fecthOneDayAgoFormatted = AggregatesEntity(
        time: dateFormat.format(oneDayAgo),
        adjusted: false,
        count: 0,
        queryCount: 0,
        requestId: '',
        results: const [],
        resultsCount: 0,
        status: '',
        ticker: widget.ticker);
    fecthFiveDaysAgoFormatted = AggregatesEntity(
        time: dateFormat.format(fiveDaysAgo),
        adjusted: false,
        count: 0,
        queryCount: 0,
        requestId: '',
        results: const [],
        resultsCount: 0,
        status: '',
        ticker: widget.ticker);
    fecthOneWeekAgoFormatted = AggregatesEntity(
        time: dateFormat.format(oneWeekAgo),
        adjusted: false,
        count: 0,
        queryCount: 0,
        requestId: '',
        results: const [],
        resultsCount: 0,
        status: '',
        ticker: widget.ticker);
    fecthOneMonthAgoFormatted = AggregatesEntity(
        time: dateFormat.format(oneMonthAgo),
        adjusted: false,
        count: 0,
        queryCount: 0,
        requestId: '',
        results: const [],
        resultsCount: 0,
        status: '',
        ticker: widget.ticker);
    fecthThreeMonthsAgoFormatted = AggregatesEntity(
        time: dateFormat.format(threeMonthsAgo),
        adjusted: false,
        count: 0,
        queryCount: 0,
        requestId: '',
        results: const [],
        resultsCount: 0,
        status: '',
        ticker: widget.ticker);
    listEntity = [
      fecthOneDayAgoFormatted,
      fecthFiveDaysAgoFormatted,
      fecthOneWeekAgoFormatted,
      fecthOneWeekAgoFormatted,
      fecthOneMonthAgoFormatted,
      fecthThreeMonthsAgoFormatted
    ];
    bloc.add(GetAggsChartEvent(fecthOneDayAgoFormatted));
  }

  @override
  void initState() {
    bloc = BlocProvider.of<AggsChartBloc>(context);
    _refreshData(); // Initial data load
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  late List<Widget> tabContents;

  int selectedTabIndex = 0;

  List<String> tabs = ['1Д', '5Д', '1Н', '1МЕС', '3МЕС'];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AggsChartBloc, AggsChartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AggsChartStateLoaded) {
          DateTime currentDate = DateTime.now();

          DateTime oneDayAgo = currentDate.subtract(const Duration(days: 1));
          DateTime fiveDaysAgo = currentDate.subtract(const Duration(days: 5));
          DateTime oneWeekAgo = currentDate.subtract(const Duration(days: 7));
          DateTime oneMonthAgo = DateTime(
              currentDate.year, currentDate.month - 1, currentDate.day);
          DateTime threeMonthsAgo = DateTime(
              currentDate.year, currentDate.month - 3, currentDate.day);
          print(oneDayAgo);
          print(fiveDaysAgo);

          DateFormat dateFormat = DateFormat('yyyy-MM-dd');
          tabContents = [
            MyChartWidget(
              startTime: dateFormat.format(oneDayAgo),
              endTime: dateFormat.format(oneDayAgo),
              chartData: [
                Result(
                    c: state.groupedDailyState.results[0].c,
                    h: state.groupedDailyState.results[0].h,
                    l: state.groupedDailyState.results[0].l,
                    n: state.groupedDailyState.results[0].n,
                    o: state.groupedDailyState.results[0].o,
                    t: state.groupedDailyState.results[0].t,
                    v: state.groupedDailyState.results[0].v,
                    vw: state.groupedDailyState.results[0].vw)
              ],
            ),
            MyChartWidget(
              startTime: dateFormat.format(fiveDaysAgo),
              endTime: dateFormat.format(oneDayAgo),
              chartData: [
                Result(
                    c: state.groupedDailyState.results[0].c,
                    h: state.groupedDailyState.results[0].h,
                    l: state.groupedDailyState.results[0].l,
                    n: state.groupedDailyState.results[0].n,
                    o: state.groupedDailyState.results[0].o,
                    t: state.groupedDailyState.results[0].t,
                    v: state.groupedDailyState.results[0].v,
                    vw: state.groupedDailyState.results[0].vw)
              ],
            ),
            MyChartWidget(
              startTime: dateFormat.format(oneWeekAgo),
              endTime: dateFormat.format(oneDayAgo),
              chartData: [
                Result(
                    c: state.groupedDailyState.results[0].c,
                    h: state.groupedDailyState.results[0].h,
                    l: state.groupedDailyState.results[0].l,
                    n: state.groupedDailyState.results[0].n,
                    o: state.groupedDailyState.results[0].o,
                    t: state.groupedDailyState.results[0].t,
                    v: state.groupedDailyState.results[0].v,
                    vw: state.groupedDailyState.results[0].vw)
              ],
            ),
            MyChartWidget(
              startTime: dateFormat.format(oneMonthAgo),
              endTime: dateFormat.format(oneDayAgo),
              chartData: [
                Result(
                    c: state.groupedDailyState.results[0].c,
                    h: state.groupedDailyState.results[0].h,
                    l: state.groupedDailyState.results[0].l,
                    n: state.groupedDailyState.results[0].n,
                    o: state.groupedDailyState.results[0].o,
                    t: state.groupedDailyState.results[0].t,
                    v: state.groupedDailyState.results[0].v,
                    vw: state.groupedDailyState.results[0].vw)
              ],
            ),
            MyChartWidget(
              startTime: dateFormat.format(threeMonthsAgo),
              endTime: dateFormat.format(oneDayAgo),
              chartData: [
                Result(
                    c: state.groupedDailyState.results[0].c,
                    h: state.groupedDailyState.results[0].h,
                    l: state.groupedDailyState.results[0].l,
                    n: state.groupedDailyState.results[0].n,
                    o: state.groupedDailyState.results[0].o,
                    t: state.groupedDailyState.results[0].t,
                    v: state.groupedDailyState.results[0].v,
                    vw: state.groupedDailyState.results[0].vw)
              ],
            ),
          ];
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'ЦЕНА:',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    state.groupedDailyState.results[0].c.toString(),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.textDark),
                  ),
                ],
              ),
              SizedBox(height: 10),
              const LineGreyPorftolioWidget(),
              Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     for (int index = 0; index < tabs.length; index++)
                  //       Column(
                  //         children: [
                  //           ElevatedButton(
                  //             onPressed: () {
                  //               setState(() {
                  //                 bloc.add(
                  //                     GetAggsChartEvent(listEntity[index]));
                  //                 selectedTabIndex = index;
                  //               });
                  //             },
                  //             style: ElevatedButton.styleFrom(
                  //               elevation: 0,
                  //               backgroundColor: selectedTabIndex == index
                  //                   ? AppColors.primary
                  //                   : Theme.of(context).scaffoldBackgroundColor,
                  //               padding: const EdgeInsets.symmetric(
                  //                   horizontal: 17, vertical: 0),
                  //             ),
                  //             child: Text(
                  //               tabs[index],
                  //               style: Theme.of(context)
                  //                   .textTheme
                  //                   .displaySmall!
                  //                   .copyWith(
                  //                     color: selectedTabIndex == index
                  //                         ? AppColors.white
                  //                         : AppColors.textDark,
                  //                     fontWeight: FontWeight.w600,
                  //                   ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),

                  //     // TabBarView
                  //     // TabBarView(controller: Ta, children: tabContents)
                  //   ],
                  // ),
                  TabBar(
                    controller: tabController,
                    indicatorColor: AppColors.primary,
                    labelColor: AppColors.primary,
                    unselectedLabelColor: AppColors.textDark,
                    onTap: (index) {
                      setState(() {
                        bloc.add(GetAggsChartEvent(listEntity[index]));
                        selectedTabIndex = index;
                      });
                    },
                    tabs: [
                      for (int index = 0; index < tabs.length; index++)
                        Tab(
                          child: Text(
                            tabs[index],
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                    ],
                  ),
                  const LineGreyPorftolioWidget(),
                  SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: TabBarView(
                      controller: tabController,
                      children: tabContents,
                    ),
                  ),

                  const LineGreyPorftolioWidget(),

                  // tabContents[selectedTabIndex],
                ],
              )
            ],
          );
        } else if (state is AggsChartStateLoading) {
          return const SafeArea(child: Center(child: Loading()));
        } else if (state is AggsChartStateError) {
          return SafeArea(
            child: Center(
              child: Text(
                state.error,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          );
        } else {
          return SafeArea(
            child: Center(
              child: Text(
                'попробуйте позже',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          );
        }
      },
    );
  }
}

class LineGreyPorftolioWidget extends StatelessWidget {
  const LineGreyPorftolioWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 8,
      color: AppColors.colorLineGrey,
    );
  }
}
