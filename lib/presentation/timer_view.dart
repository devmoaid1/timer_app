import 'package:flutter/material.dart';

import 'widgets/timer_view_body.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer Screen'),
        centerTitle: true,
        elevation: 1.3,
      ),
      body: const TimerViewBody(),
    );
  }
}
