import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../common/theme/colors.dart';

class PortFolioPage extends StatelessWidget {
  const PortFolioPage({Key? key});

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
          padding: EdgeInsets.only(left: 3),
          child: Text(
            'BTC / USDT',
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icon/search.svg'),
            onPressed: () {},
          ),
          SizedBox(width: 15)
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              SizedBox(height: 22),
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
                  SizedBox(width: 20),
                  Text(
                    '32.340,52940',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.textDark),
                  ),
                ],
              ),
              LineGreyPorftolioWidget(),
              // DetailedDataDisplayCryptoChartWidget(chartData: []),
              DateTabBarChartsWidget(),
              LineGreyPorftolioWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class DateTabBarChartsWidget extends StatefulWidget {
  const DateTabBarChartsWidget({Key? key});

  @override
  State<DateTabBarChartsWidget> createState() => _DateTabBarChartsWidgetState();
}

class _DateTabBarChartsWidgetState extends State<DateTabBarChartsWidget> {
  int selectedTabIndex = 0;

  List<String> tabs = ['1Д', '5Д', '1Н', '1МЕС', '3МЕС'];

  // List<Widget> tabContents = [
  //   DetailedDataDisplayCryptoChartWidget(chartData: []),
  //   DetailedDataDisplayCryptoChartWidget(chartData: []),
  //   DetailedDataDisplayCryptoChartWidget(chartData: []),
  //   DetailedDataDisplayCryptoChartWidget(chartData: []),
  //   DetailedDataDisplayCryptoChartWidget(chartData: []),
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int index = 0; index < tabs.length; index++)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedTabIndex = index;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: selectedTabIndex == index
                          ? AppColors.primary
                          : Theme.of(context).scaffoldBackgroundColor,
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                    ),
                    child: Text(
                      tabs[index],
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: AppColors.textDark,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),

                // TabBarView
              ],
            ),
            LineGreyPorftolioWidget(),
            // tabContents[selectedTabIndex],
          ],
        )
      ],
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
