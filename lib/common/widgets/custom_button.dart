import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;


  const ButtonCustom({super.key, required this.onPressed, required this.text, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50, // Adjustable height over here we can maintain the button height if kept on the screen size it might make it look weird.
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xff037dff),
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
