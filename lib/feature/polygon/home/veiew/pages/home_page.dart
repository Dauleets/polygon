import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polygontrade/common/widgets/chart_styling.dart';
import 'package:polygontrade/common/widgets/plotting_cryptochart_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Криптовалюта',
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset('assets/icon/search.svg'),
              onPressed: () {},
            )
          ],
        ),
        body: SafeArea(
          child: ListView(),
        ));
  }
}
