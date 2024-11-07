import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Color ? bg;
  final Color? textColor;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.bg,
    this.textColor,
    this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),  // Set border radius to 8
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: textColor),
      ),
    );
  }
}
