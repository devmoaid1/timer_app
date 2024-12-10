import 'package:flutter/material.dart';
import 'package:timers_practice/core/theme/app_colors.dart';
import 'package:timers_practice/core/widgets/custom_buttom.dart';

import '../timer_view_model.dart';
import 'timer_section.dart';

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
            child: TimerListenableBuilder(viewModel: viewModel, size: size),
          ),
          SizedBox(
            height: size.height * 0.15,
          ),
          ControlButtonsListenableBuilder(viewModel: viewModel, size: size),
        ],
      ),
    );
  }
}

class ControlButtonsListenableBuilder extends StatelessWidget {
  const ControlButtonsListenableBuilder({
    super.key,
    required this.viewModel,
    required this.size,
  });

  final TimerViewModel viewModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
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
                    onPressed: () => viewModel.handleResetTimer(),
                    text: 'Reset'),
              ),
            ],
          );
        });
  }
}

class TimerListenableBuilder extends StatelessWidget {
  const TimerListenableBuilder({
    super.key,
    required this.viewModel,
    required this.size,
  });

  final TimerViewModel viewModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return TimerSection(
              size: size.width, remainingSeconds: viewModel.remainingSeconds);
        });
  }
}
