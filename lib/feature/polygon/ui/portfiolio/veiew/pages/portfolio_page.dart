import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../common/theme/colors.dart';
import '../widgets/date_tabbar_widgets.dart';

// Страница портфеля с отображением детальной информации о выбранной криптовалюте
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
              // Компонент для отображения графика и детальной информации
              DateTabBarChartsWidget(ticker: ticker),
              const LineGreyPorftolioWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
