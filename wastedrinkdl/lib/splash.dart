import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wastedrinkdl/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Center(
              child: Image(image: AssetImage('assets/logo.png')),
            ),
          ),
          Text(
            'MAKE LIFE EASIER',
            style: Theme.of(context).textTheme.overline!.merge(TextStyle(
                color: Theme.of(context).colorScheme.secondaryVariant)),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
