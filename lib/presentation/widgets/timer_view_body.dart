import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timers_practice/core/widgets/custom_buttom.dart';

class TimerViewBody extends StatefulWidget {
  const TimerViewBody({
    super.key,
  });

  @override
  State<TimerViewBody> createState() => _TimerViewBodyState();
}

class _TimerViewBodyState extends State<TimerViewBody> {
  late final Timer _timer;
  int _remainingSeconds = 30;

  void startCountDown(int seconds) {
    log('start countDown');
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_remainingSeconds <= 0) {
          timer.cancel();
          log('finished count down');
        } else {
          setState(() {
            _remainingSeconds--;
          });
        }

        log('count down $_remainingSeconds');
      },
    );
  }

  void stopCountDown() {
    log('stop countDown');
    _timer.cancel();
    setState(() {});
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              _remainingSeconds.toString(),
              style: const TextStyle(fontSize: 50),
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.15,
          ),
          CustomButton(
              onPressed: () => startCountDown(_remainingSeconds),
              text: 'Start'),
        ],
      ),
    );
  }
}
