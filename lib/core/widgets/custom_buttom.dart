import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  const CustomButton(
      {super.key, required this.onPressed, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(
        vertical: 18,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Set the radius here
      ),
      color: color ?? Theme.of(context).colorScheme.primary,
      child: Text(text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          )),
    );
  }
}
