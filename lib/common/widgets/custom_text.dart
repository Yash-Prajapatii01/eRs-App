import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final VoidCallback? ontap;
  final Color? color;

  const CustomText({super.key, required this.text, this.ontap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Text(
        text,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
