import 'package:flutter/material.dart';

import 'common/theme/theme.dart';
import 'feature/polygon/home/veiew/pages/home_page.dart';

void main() {
  runApp(const MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Polygon Demo',
        debugShowCheckedModeBanner: false,
        theme: Styles.themeData(context),
        home: HomePage());
  }
}
