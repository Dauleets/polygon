import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:polygontrade/feature/polygon/portfiolio/veiew/pages/portfolio_page.dart';

import '../../../../../common/theme/colors.dart';
import '../../../../../common/widgets/loading.dart';
import '../../bloc/grouped_daily_bloc.dart';

class HomePageBodyWidget extends StatefulWidget {
  const HomePageBodyWidget({
    super.key,
  });

  @override
  State<HomePageBodyWidget> createState() => _HomePageBodyWidgetState();
}

class _HomePageBodyWidgetState extends State<HomePageBodyWidget> {
  late GroupedDailyBloc bloc;

  Future<void> _refreshData() async {
    DateTime today = DateTime.now();
    DateTime yesterday = today.subtract(const Duration(days: 1));
    String formattedDate = DateFormat('yyyy-MM-dd').format(yesterday);
    bloc.add(GetGroupedDailyEvent(formattedDate));
  }

  @override
  void initState() {
    bloc = BlocProvider.of<GroupedDailyBloc>(context);
    _refreshData(); // Initial data load
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupedDailyBloc, GroupedDailyState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GroupedDailyStateLoaded) {
          return SafeArea(
            child: RefreshIndicator(
              onRefresh: _refreshData, // Triggered when pulled down
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: AppColors.white),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/icon/pencil.svg',
                                    // color: AppColors.colorLigthGrey,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Тикер / Название',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            color: AppColors.colorLigthGrey),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Цена',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                color:
                                                    AppColors.colorLigthGrey),
                                      ),
                                      const SizedBox(width: 5),
                                      SvgPicture.asset(
                                        'assets/icon/arrows.svg',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 35),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Изм. % \$',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                color:
                                                    AppColors.colorLigthGrey),
                                      ),
                                      const SizedBox(width: 5),
                                      SvgPicture.asset(
                                        'assets/icon/arrows.svg',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.groupedDailyState.resultsCount,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final result = state.groupedDailyState.results[index];
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PortFolioPage(
                                        ticker: state
                                            .groupedDailyState.results[index].t
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 22),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Ticker / Название
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          result.t,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      // Цена
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          result.c.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      // Изм. % $
                                      const SizedBox(width: 35),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              result.h.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          const Color.fromRGBO(
                                                              99, 190, 55, 1)),
                                            ),
                                            Text(
                                              result.l.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall!
                                                  .copyWith(
                                                      color: AppColors
                                                          .colorLigthGrey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is GroupedDailyStateLoading) {
          return const SafeArea(child: Center(child: Loading()));
        } else if (state is GroupedDailyStateError) {
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
