import 'package:flutter/material.dart';

import 'feature/polygon/home/veiew/pages/home_page.dart';

void main() {
  runApp(const MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Polygon Demo', home: HomePage());
  }
}
