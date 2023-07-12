import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polygontrade/common/widgets/chart_styling.dart';
import 'package:polygontrade/common/widgets/plotting_cryptochart_widget.dart';

import '../../../../../common/theme/colors.dart';

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
              'Криптовалюта',
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
              Container(
                padding: EdgeInsets.zero,
                width: double.infinity,
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/icon/pencil.svg',
                              color: AppColors.colorLigthGrey,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Тикер / Название',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: AppColors.colorLigthGrey),
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
                                          color: AppColors.colorLigthGrey),
                                ),
                                const SizedBox(width: 5),
                                SvgPicture.asset(
                                  'assets/icon/arrows.svg',
                                  color: AppColors.colorLigthGrey,
                                ),
                              ],
                            ),
                            const SizedBox(width: 25),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Изм. % \$',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: AppColors.colorLigthGrey),
                                ),
                                const SizedBox(width: 5),
                                SvgPicture.asset(
                                  'assets/icon/arrows.svg',
                                  color: AppColors.colorLigthGrey,
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 15,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'BTC / USDT',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '32340,52940',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(width: 25),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '+4.08%',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    99, 190, 55, 1)),
                                      ),
                                      Text(
                                        'B+0.37',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                              color: AppColors.colorLigthGrey,
                                            ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        Divider(), //                           <-- Divider
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        )));
  }
}
