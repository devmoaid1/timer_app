import 'dart:async';

import 'package:flutter/material.dart';

enum TimerState { initial, running, paused }

class TimerViewModel extends ChangeNotifier {
  TimerViewModel._();
  static final TimerViewModel _instance = TimerViewModel._();
  static TimerViewModel get instance => _instance;
  int _remainingSeconds = 15;
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
          // reset when timer finish
          _timerState = TimerState.initial;
          _remainingSeconds = 15;
          timer.cancel();
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
      _startCountDown();
    } else {
      _pauseCountDown();
    }
  }

  void handleResetTimer() {
    _timerState = TimerState.initial;
    _remainingSeconds = 15;
    timer.cancel();
    notifyListeners();
  }
}
