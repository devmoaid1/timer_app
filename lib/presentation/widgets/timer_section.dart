import 'package:flutter/material.dart';

class TimerSection extends StatelessWidget {
  const TimerSection({
    super.key,
    required this.size,
    required this.remainingSeconds,
    required this.progressColor,
  });

  final double size;
  final Color progressColor;
  final int remainingSeconds;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size * 0.4,
          height: size * 0.4,
          child: Transform.flip(
            flipX: true,
            child: CircularProgressIndicator(
              value: remainingSeconds / 15,
              strokeWidth: 9,
              color: progressColor,
            ),
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
