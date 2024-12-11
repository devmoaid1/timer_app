import 'package:flutter/material.dart';
import 'package:timers_practice/core/theme/app_colors.dart';

class TimerSection extends StatelessWidget {
  const TimerSection({
    super.key,
    required this.size,
    required this.remainingSeconds,
    required this.progressColor,
    required this.timerFontSize,
    required this.fraction,
  });

  final double size;
  final Color progressColor;
  final int remainingSeconds;
  final double timerFontSize;
  final int fraction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: Transform.flip(
            flipX: true,
            child: CircularProgressIndicator(
              value: remainingSeconds / fraction,
              strokeWidth: 9,
              color: progressColor,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
        ),
        Text(
          remainingSeconds.toString(),
          style: TextStyle(fontSize: timerFontSize),
        ),
      ],
    );
  }
}
