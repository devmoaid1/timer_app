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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(),
          Center(
            child: ListenableBuilder(
                listenable: viewModel,
                builder: (context, _) {
                  final progressColor = () {
                    switch (viewModel.timerState) {
                      case TimerState.running:
                        return Colors.green;
                      case TimerState.paused:
                        return Colors.red;
                      default:
                        return AppColors
                            .primaryColor; // Default color if needed
                    }
                  }();
                  return TimerSection(
                      key: ValueKey(viewModel.remainingSeconds),
                      progressColor: progressColor,
                      timerFontSize: 50,
                      size: size.width * 0.4,
                      fraction: 15,
                      remainingSeconds: viewModel.remainingSeconds);
                }),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Center(
            child: ListenableBuilder(
                listenable: viewModel,
                builder: (context, _) {
                  final progressColor = () {
                    switch (viewModel.cycleState) {
                      case CycleState.onTime:
                        return Colors.green;
                      case CycleState.offTime:
                        return Colors.red;
                      default:
                        return Colors.green; // Default color if needed
                    }
                  }();
                  return TimerSection(
                      key: ValueKey(viewModel.cycleSeconds),
                      progressColor: progressColor,
                      timerFontSize: 25,
                      fraction:
                          viewModel.cycleState == CycleState.onTime ? 8 : 4,
                      size: size.width * 0.2,
                      remainingSeconds: viewModel.cycleSeconds);
                }),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          ControlButtonsListenableBuilder(viewModel: viewModel, size: size),
          const Spacer(),
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
                        ? 'Pause'
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
