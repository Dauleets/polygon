import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polygontrade/common/widgets/show_custom_snack_bar.dart';
import 'package:polygontrade/feature/polygon/ui/home/bloc/grouped_daily_bloc.dart';
import 'package:polygontrade/feature/polygon/ui/home/veiew/widgets/tickers_page.dart';

import '../widgets/home_appbar.dart';
import '../widgets/home_body_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
        GlobalKey<ScaffoldMessengerState>();
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        appBar:
            const SearchCryptoWidget(), // Виджет AppBar для поиска криптовалют
        body: BlocConsumer<GroupedDailyBloc, GroupedDailyState>(
          listener: (context, state) {
            if (state is SearchTickersStateLoaded && state.tickets.isEmpty) {
              showCustomSnackBar(context,
                  'не найдено'); // Отображение сообщения Snackbar, если список криптовалют пуст
            }
          },
          builder: (context, state) {
            if (state is SearchTickersStateLoaded) {
              return const BodySearchTickersWidget(); // Виджет для отображения найденных криптовалют
            }
            if (state is GroupedDailyStateLoaded) {
              return const HomePageBodyWidget(); // Виджет для отображения списка криптовалют
            } else {
              return const HomePageBodyWidget(); // Виджет для отображения списка криптовалют по умолчанию
            }
          },
        ),
      ),
    );
  }
}
