import 'package:flutter/material.dart';
import 'package:timers_practice/presentation/timer_view.dart';

import 'core/theme/app_colors.dart';

class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timers Practice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Montserrat",
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
            primary: AppColors.primaryColor,
            secondary: AppColors.secondaryColor),
        useMaterial3: true,
      ),
      home: const TimerView(),
    );
  }
}
