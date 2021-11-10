import 'package:flutter/material.dart';
import 'package:wastedrinkdl/home.dart';
import 'package:wastedrinkdl/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      home: const HomePage(),
    );
  }
}