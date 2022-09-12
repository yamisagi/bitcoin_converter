import 'package:bitcoin_app/page/home_page.dart';
import 'package:bitcoin_app/theme/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainScreen());

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ProductTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
