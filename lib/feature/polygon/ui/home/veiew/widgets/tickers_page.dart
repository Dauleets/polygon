import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../../../common/theme/colors.dart';
import '../../../../../../common/widgets/loading.dart';
import '../../../../../../common/widgets/show_custom_snack_bar.dart';
import '../../../portfiolio/veiew/pages/portfolio_page.dart';
import '../../bloc/grouped_daily_bloc.dart';
import 'home_body_widget.dart';
import '../pages/home_page.dart';

class BodySearchTickersWidget extends StatefulWidget {
  const BodySearchTickersWidget({Key? key}) : super(key: key);

  @override
  State<BodySearchTickersWidget> createState() =>
      _BodySearchTickersWidgetState();
}

class _BodySearchTickersWidgetState extends State<BodySearchTickersWidget> {
  late GroupedDailyBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<GroupedDailyBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocConsumer<GroupedDailyBloc, GroupedDailyState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SearchTickersStateLoaded) {
            return SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.tickets.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final result = state.tickets[index];
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PortFolioPage(
                                        ticker: result.ticker.toString(),
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

                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                result.ticker,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium!
                                                    .copyWith(
                                                        fontSize: 12,
                                                        color:
                                                            AppColors.primary,
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                              SizedBox(width: 9),
                                              Container(
                                                padding: EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color: AppColors
                                                            .colorLigthGrey),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                child: Text(
                                                  result.ticker,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium!
                                                      .copyWith(
                                                          color: AppColors
                                                              .colorLigthGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            result.market.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                    color: AppColors
                                                        .colorLigthGrey,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                        ],
                                      ),

                                      // Цена
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
            );
          } else if (state is GroupedDailyStateLoading ||
              state is GroupedDailyInitial) {
            return const SafeArea(child: Center(child: Loading()));
          } else if (state is SearchTickersStateError) {
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
      ),
    );
  }
}
