import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

enum TimerState { initial, running, paused, stopped }

class TimerViewModel extends ChangeNotifier {
  TimerViewModel._();
  static final TimerViewModel _instance = TimerViewModel._();
  static TimerViewModel get instance => _instance;
  int _remainingSeconds = 30;
  int get remainingSeconds => _remainingSeconds;

  TimerState _timerState = TimerState.initial;
  TimerState get timerState => _timerState;
  late Timer _timer;
  Timer get timer => _timer;

  void _startCountDown() {
    if (_timerState != TimerState.running) {
      _timerState = TimerState.running;
      notifyListeners();
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_remainingSeconds <= 0) {
          _timerState = TimerState.stopped;
          _remainingSeconds = 30;
          timer.cancel();
          log('Count down stopped');
        } else {
          _remainingSeconds--;
        }
        notifyListeners();
      },
    );
  }

  void _pauseCountDown() {
    _timerState = TimerState.paused;
    _timer.cancel();
    notifyListeners();
  }

  void handleTimerButton() {
    if (_timerState != TimerState.running) {
      log('Starting count down');
      _startCountDown();
    } else {
      log('Pausing count down');
      _pauseCountDown();
    }
  }
}
