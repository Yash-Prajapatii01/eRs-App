import 'package:ers_app/common/widgets/Responsive_Layout.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const TextFieldCustom({
    super.key,
    this.controller,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveLayout(context);
    return SizedBox(
      width: double.infinity,
      height: responsive.getHeight(50),
      child: TextField(
        controller: controller,
        maxLines: 1,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle:TextStyle(
            color: Color.fromRGBO(95, 95, 95, 0.39),
            fontSize: responsive.getFontSize(14),
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(responsive.getRadius(5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(responsive.getRadius(5)),
            borderSide:  BorderSide(
              color: Color(0xff037dff),
              width: responsive.getWidth(0.5),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(responsive.getRadius(5)),
            borderSide: BorderSide(
              color: const Color.fromRGBO(208, 213, 221, 1),
              width: responsive.getWidth(0.5),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(responsive.getRadius(5)),
            borderSide:  BorderSide(color: Colors.red, width: responsive.getWidth(0.5)),
          ),
          // errorMaxLines: 2,
          contentPadding:  EdgeInsets.fromLTRB(
            responsive.getWidth(16), // Responsive padding
            responsive.getHeight(20), //20 -> 14.5 as the text was getting clipped off due to 20 + 20 = 40
            responsive.getWidth(16),
            responsive.getHeight(14.5),
          ),
          errorStyle:  TextStyle(height: responsive.getHeight(1.0)),
        ),
      ),
    );
  }
}
//
//
// //prefixIcon: prefixIcon != null ? Padding(padding: const EdgeInsets.only(right: 10), child: prefixIcon) : null,
// // suffixIcon: suffixIcon != null ? Padding(padding: const EdgeInsets.only(left: 10), child: suffixIcon) : null,




// import 'package:flutter/material.dart';
//
// import '../../features/login/login.dart';
//
// class TextFieldCustom extends StatelessWidget {
//   final TextEditingController? controller;
//   final String hintText;
//   final bool obscureText;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//
//   const TextFieldCustom({
//     super.key,
//     this.controller,
//     required this.hintText,
//     this.obscureText = false,
//     this.prefixIcon,
//     this.suffixIcon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final responsive = ResponsiveLayout(context);
//
//     return SizedBox(
//       width: double.infinity,
//       height: responsive.getHeight(50),
//       child: TextField(
//         controller: controller,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           prefixIcon: prefixIcon,
//           suffixIcon: suffixIcon,
//           hintText: hintText,
//           hintStyle: TextStyle(
//             color: const Color.fromRGBO(95, 95, 95, 0.39),
//             fontSize: responsive.getFontSize(14),
//             fontWeight: FontWeight.w400,
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(responsive.getRadius(5)),
//           ),
//           contentPadding: EdgeInsets.fromLTRB(
//             responsive.getWidth(16),
//             responsive.getHeight(20),
//             responsive.getWidth(16),
//             responsive.getHeight(20),
//           ),
//         ),
//       ),
//     );
//   }
// }