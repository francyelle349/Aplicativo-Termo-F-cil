import 'package:app/auth/view/pages/InitialScreen.dart';
import 'package:app/core/theme/Theme.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick Definition',
      theme: AppTheme.ThemeMode,
      home: const InitialScreen(),
    );
  }
}
