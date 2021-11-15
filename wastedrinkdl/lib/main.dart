import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wastedrinkdl/bloc/ai_bloc.dart';
import 'package:wastedrinkdl/repositories/ai_repository.dart';
import 'package:wastedrinkdl/splash.dart';
import 'package:wastedrinkdl/theme.dart';

import 'bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  final AiRepository aiRepository = AiRepository();
  runApp(MyApp(
    aiRepository: aiRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.aiRepository}) : super(key: key);

  final AiRepository aiRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => AiBloc(aiRepository),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.themeData,
          home: const SplashPage(),
        ));
  }
}
