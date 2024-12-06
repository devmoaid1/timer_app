import 'package:flutter/material.dart';
import 'package:timers_practice/presentation/timer_view.dart';

class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TimerView(),
    );
  }
}
