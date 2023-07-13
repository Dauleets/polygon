import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../common/theme/colors.dart';
import '../widgets/home_body_widget.dart';

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
          backgroundColor: AppColors.white,
          title: const Padding(
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
            const SizedBox(width: 15)
          ],
        ),
        body: const HomePageBodyWidget());
  }
}
