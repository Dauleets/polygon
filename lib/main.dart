import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:polygontrade/feature/polygon/home/bloc/grouped_daily_bloc.dart';
import 'injection.dart' as di;
import 'package:intl/date_symbol_data_local.dart';

import 'common/theme/theme.dart';
import 'feature/polygon/home/veiew/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await di.init();
  initializeDateFormatting().then((_) {
    runApp(const MainWidget());
  });
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<GroupedDailyBloc>()),
      ],
      child: MaterialApp(
        title: 'Polygon Demo',
        debugShowCheckedModeBanner: false,
        theme: Styles.themeData(context),
        home: HomePage(),
      ),
    );
  }
}
