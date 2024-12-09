import 'package:flutter/material.dart';
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
    final mediaQuery = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListenableBuilder(
              listenable: viewModel,
              builder: (context, child) => Center(
                    child: Text(
                      viewModel.remainingSeconds.toString(),
                      style: const TextStyle(fontSize: 50),
                    ),
                  )),
          SizedBox(
            height: mediaQuery.height * 0.15,
          ),
          ListenableBuilder(
              listenable: viewModel,
              builder: (context, child) {
                return CustomButton(
                    onPressed: () => viewModel.handleTimerButton(),
                    text: viewModel.timerState == TimerState.running
                        ? 'Stop'
                        : 'Start');
              }),
        ],
      ),
    );
  }
}
