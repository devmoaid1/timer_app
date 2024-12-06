import 'package:flutter/material.dart';

import 'widgets/timer_view_body.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Timer Screen',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        elevation: 1.3,
      ),
      body: const TimerViewBody(),
    );
  }
}
