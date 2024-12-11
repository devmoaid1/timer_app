import 'dart:async';

import 'package:flutter/material.dart';

enum TimerState { initial, running, paused }

enum CycleState { onTime, offTime }

class TimerViewModel extends ChangeNotifier {
  TimerViewModel._();
  static final TimerViewModel _instance = TimerViewModel._();
  static TimerViewModel get instance => _instance;
  int _remainingSeconds = 15;
  int _cycleSeconds = 8;
  int get cycleSeconds => _cycleSeconds;
  int get remainingSeconds => _remainingSeconds;

  TimerState _timerState = TimerState.initial;
  CycleState _cycleState = CycleState.onTime;
  CycleState get cycleState => _cycleState;
  TimerState get timerState => _timerState;
  late Timer _timer;
  Timer get timer => _timer;
  late Timer _cycleTimer;
  Timer get cycleTimer => _cycleTimer;
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

  void _startCycleCountDown() {
    _cycleTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_timerState == TimerState.initial ||
            _timerState == TimerState.paused) {
          // stop cycle timer when main timer is initial or paused
          timer.cancel();
        } else {
          if (_cycleSeconds == 0 && _cycleState == CycleState.onTime) {
            // switch to off time cycle when on time cycle finish
            _cycleState = CycleState.offTime;
            _cycleSeconds = 5;
          } else if (_cycleSeconds == 0 && _cycleState == CycleState.offTime) {
            // switch to on time cycle when off time cycle finish
            _cycleState = CycleState.onTime;
            _cycleSeconds = 9;
          }
          _cycleSeconds--;
        }
        notifyListeners();
      },
    );
  }

  void _pauseCountDown() {
    _timerState = TimerState.paused;
    // cancel both timers
    _timer.cancel();
    _cycleTimer.cancel();
    notifyListeners();
  }

  void handleTimerButton() {
    if (_timerState != TimerState.running) {
      _startCountDown();
      _startCycleCountDown();
    } else {
      _pauseCountDown();
    }
  }

  void handleResetTimer() {
    // reset all values
    _timerState = TimerState.initial;
    _cycleState = CycleState.onTime;
    _remainingSeconds = 15;
    _cycleSeconds = 8;
    _timer.cancel();
    _cycleTimer.cancel();

    notifyListeners();
  }
}
