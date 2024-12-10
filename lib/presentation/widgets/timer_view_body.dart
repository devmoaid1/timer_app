import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timers_practice/core/theme/app_colors.dart';
import 'package:timers_practice/core/widgets/custom_buttom.dart';

import '../timer_view_model.dart';

class TimerViewBody extends StatefulWidget {
  const TimerViewBody({
    super.key,
  });

  @override
  State<TimerViewBody> createState() => _TimerViewBodyState();
}

class _TimerViewBodyState extends State<TimerViewBody> {
  final viewModel = TimerViewModel.instance;
  @override
  void dispose() {
    viewModel.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ListenableBuilder(
                listenable: viewModel,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment
                        .center, // Ensures all children are centered in the Stack
                    children: [
                      SizedBox(
                        width: size.width * 0.4,
                        height: size.width * 0.4,
                        child: CircularProgressIndicator(
                          value: viewModel.remainingSeconds / 30,
                          strokeWidth: 9,
                        ),
                      ),
                      Text(
                        viewModel.remainingSeconds.toString(),
                        style: const TextStyle(fontSize: 50),
                      ),
                    ],
                  );
                }),
          ),
          SizedBox(
            height: size.height * 0.15,
          ),
          ListenableBuilder(
              listenable: viewModel,
              builder: (context, child) {
                return Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                          onPressed: () => viewModel.handleTimerButton(),
                          text: viewModel.timerState == TimerState.running
                              ? 'Stop'
                              : 'Start'),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Expanded(
                      child: CustomButton(
                          color: AppColors.errorColor,
                          onPressed: () => viewModel.handleTimerButton(),
                          text: 'Reset'),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
