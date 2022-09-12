import 'package:flutter/material.dart';

class ProductTheme {
  static final darkTheme = ThemeData.dark().copyWith(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        scrolledUnderElevation: 0,
      ));
}
