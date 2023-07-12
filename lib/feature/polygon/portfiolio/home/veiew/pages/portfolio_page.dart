import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polygontrade/common/widgets/chart_styling.dart';
import 'package:polygontrade/common/widgets/plotting_cryptochart_widget.dart';

import '../../../../../../common/theme/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleTextStyle: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(fontWeight: FontWeight.w400),
        backgroundColor: Theme.of(context).cardColor,
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
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              LineGreyPorftolioWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class LineGreyPorftolioWidget extends StatelessWidget {
  const LineGreyPorftolioWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 8,
      color: AppColors.colorLineGrey,
    );
  }
}
