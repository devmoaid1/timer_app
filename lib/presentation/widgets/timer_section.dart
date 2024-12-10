import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class TimerSection extends StatelessWidget {
  const TimerSection({
    super.key,
    required this.size,
    required this.remainingSeconds,
  });

  final double size;

  final int remainingSeconds;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size * 0.4,
          height: size * 0.4,
          child: CircularProgressIndicator(
            value: remainingSeconds / 30,
            strokeWidth: 9,
            color: AppColors.errorColor,
          ),
        ),
        Text(
          remainingSeconds.toString(),
          style: const TextStyle(fontSize: 50),
        ),
      ],
    );
  }
}
