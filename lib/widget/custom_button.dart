import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? bg;
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
          borderRadius: BorderRadius.circular(8), // Set border radius to 8
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: textColor),
      ),
    );
  }
}


//custom buttom bg color
class CustomButtonBg extends StatelessWidget {
  final void Function() onpressed;
  final String text;
  final Color color;
  final Color textColor;
  const CustomButtonBg({
    super.key,
    required this.onpressed,
    required this.text,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(

          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
