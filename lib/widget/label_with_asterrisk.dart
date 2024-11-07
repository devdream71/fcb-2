import 'package:flutter/material.dart';

class LabelWithAsterisk extends StatelessWidget {
  final String labelText;
  final bool isRequired;
  final Color ? color;

  const LabelWithAsterisk({
    super.key,
    required this.labelText,
    this.isRequired = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        if (isRequired)
          const Text(
            "*",
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}