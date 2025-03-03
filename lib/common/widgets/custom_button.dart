// import 'package:flutter/material.dart';
//
// class ButtonCustom extends StatelessWidget {
//   final VoidCallback? onPressed;
//   final String text;
//   final Color? backgroundColor;
//   final Color? textColor;
//   final String? iconAsImage;
//   final double? elevation;
//
//
//   const ButtonCustom({super.key, required this.onPressed, required this.text, this.backgroundColor, this.textColor, this.iconAsImage, this.elevation});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 52, // Adjustable height over here we can maintain the button height if kept on the screen size it might make it look weird.
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: backgroundColor ?? const Color(0xff037dff),
//           elevation: elevation,
//           padding: EdgeInsets.all(10),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(4),
//           ),
//         ),
//         child: iconAsImage != null ? Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(iconAsImage!, height: 24,width: 24,),
//             SizedBox(width: 10,),
//             Text(
//               text,
//               style: TextStyle(
//                 color: textColor ?? Colors.white,
//                 fontWeight: FontWeight.w300,
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ) : Text(
//           text,
//           style: TextStyle(
//             color: textColor ?? Colors.white,
//             fontWeight: FontWeight.w300,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:ers_app/common/widgets/Responsive_Layout.dart';
import 'package:flutter/material.dart';

// Assuming ResponsiveLayout is imported if in a separate file
// e.g., import 'package:your_app/responsive_layout.dart';

class ButtonCustom extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final String? iconAsImage;

  const ButtonCustom({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.iconAsImage,
  });

  @override
  Widget build(BuildContext context) {
    // Create an instance of ResponsiveLayout with the current context
    final responsive = ResponsiveLayout(context);

    return SizedBox(
      width: double.infinity, // Takes full width of parent, inherently responsive
      height: responsive.getHeight(52), // Responsive height based on design size
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xff037dff), // Optional, can be scaled if needed
          padding: EdgeInsets.all(responsive.getWidth(10)), // Responsive uniform padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(responsive.getRadius(4)), // Responsive radius
          ),
        ),
        child: iconAsImage != null
            ? Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconAsImage!,
              height: responsive.getWidth(24), // Responsive icon height
              width: responsive.getWidth(24), // Responsive icon width
            ),
            SizedBox(width: responsive.getWidth(10)), // Responsive spacing
            Text(
              text,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: responsive.getFontSize(16), // Responsive font size
              ),
            ),
          ],
        )
            : Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: responsive.getFontSize(16), // Responsive font size
          ),
        ),
      ),
    );
  }
}