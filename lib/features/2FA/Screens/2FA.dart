// import 'package:ers_app/common/widgets/Responsive_Layout.dart';
// import 'package:ers_app/common/widgets/buildOvalShapes.dart';
// import 'package:ers_app/common/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class TwoFactorAuthScreen extends StatefulWidget {
//   @override
//   _TwoFactorAuthScreenState createState() => _TwoFactorAuthScreenState();
// }

// class _TwoFactorAuthScreenState extends State<TwoFactorAuthScreen> {
//   final List<TextEditingController> _controllers =
//       List.generate(6, (index) => TextEditingController());
//   final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

//   @override
//   void initState() {
//     super.initState();
//     for (int i = 0; i < _controllers.length; i++) {
//       final int index = i;
//       _focusNodes[index].addListener(() {
//         setState(() {});
//         // if (_focusNodes[index].hasFocus) {
//         //   _controllers[index].selection = TextSelection(
//         //     baseOffset: 0,
//         //     extentOffset: _controllers[index].text.length,
//         //   );
//         // }
//       });
//     }
//   }

//   void _onOtpChanged(String value, int index) {
//     setState(() {});
//     if (value.isNotEmpty) {
//       if (index < 5) {
//         FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
//       }
//     }
//     // setState(() {});
//   }

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     for (var focusNode in _focusNodes) {
//       focusNode.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final responsive = ResponsiveLayout(context);

//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Background image
//             Positioned.fill(
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Image.asset(
//                   'assets/bottomCenter.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),

//             // Decorative left-side oval shape
//             Positioned(
//               top: responsive.getHeight(103),
//               left: responsive.getWidth(-25),
//               child: buildOvalShape(
//                   responsive, 125, 59, Color.fromRGBO(235, 229, 247, 0.2)),
//             ),

//             // Decorative right-side oval shape
//             Positioned(
//               top: responsive.getHeight(187),
//               left: responsive.getWidth(310),
//               child: buildOvalShape(
//                   responsive, 494, 58, Color.fromRGBO(255, 253, 230, 0.5)),
//             ),

//             // Decorative bottom-right oval shape
//             Positioned(
//               top: responsive.getHeight(440),
//               left: responsive.getWidth(330),
//               child: buildOvalShape(
//                   responsive, 494, 69, Color.fromRGBO(245, 240, 254, 0.6)),
//             ),

//             // App logo
//             Positioned(
//               top: responsive.getHeight(124),
//               left: responsive.getWidth(99),
//               child: SizedBox(
//                 width: responsive.getWidth(194),
//                 height: responsive.getHeight(75),
//                 child: Image.asset('assets/ers_logo_banner.png',
//                     fit: BoxFit.contain),
//               ),
//             ),

//             // Main content
//             Positioned(
//               top: responsive.getHeight(231),
//               left: responsive.getWidth(28),
//               child: SizedBox(
//                 width: responsive.getWidth(337),
//                 // height: responsive.getHeight(300), // Increased height
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Two Factor Authentication",
//                       style: TextStyle(
//                           fontSize: responsive.getFontSize(22),
//                           fontWeight: FontWeight.w400),
//                     ),
//                     SizedBox(height: responsive.getHeight(12)),
//                     Text(
//                       "Enter the 6-digit verification code from your authenticator app.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: responsive.getFontSize(14),
//                           color: Color.fromRGBO(51, 51, 51, 0.5)),
//                     ),
//                     SizedBox(height: responsive.getHeight(21)),

//                     // OTP fields - Adjusted to fit within container
//                     SizedBox(
//                       width: responsive.getWidth(337),
//                       height: responsive.getHeight(56),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: List.generate(6, (index) {
//                           bool isFilled = _controllers[index].text.isNotEmpty;
//                           // Smaller fixed size for OTP boxes
//                           return Container(
//                             width: responsive.getWidth(45), // Reduced from 52
//                             height: responsive.getHeight(48), // Reduced from 56
//                             padding: EdgeInsets.symmetric(
//                               horizontal: responsive.getWidth(14),
//                               vertical: responsive.getHeight(16),
//                             ),
//                             margin: EdgeInsets.only(
//                                 right:
//                                     responsive.getWidth(5)), // Reduced from 5
//                             decoration: BoxDecoration(
//                               color: isFilled
//                                   ? Color.fromRGBO(233, 242, 251, 1)
//                                   : Colors.white,
//                               border: Border.all(
//                                   color: isFilled
//                                       ? Colors.blue
//                                       : Colors.grey.shade400,
//                                   width: responsive.getWidth(0.5)),
//                               borderRadius: BorderRadius.circular(
//                                   responsive.getRadius(16)),
//                             ),
//                             child: Container(
//                               width: responsive.getWidth(24), // Reduced from 24
//                               height: responsive.getHeight(24),
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: responsive.getWidth(8),
//                                 vertical: responsive.getHeight(12),
//                               ), // Reduced from 24
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   Focus(
//                                     onKeyEvent: (node, event) {
//                                       if (event is KeyDownEvent &&
//                                           event.logicalKey ==
//                                               LogicalKeyboardKey.backspace) {
//                                         if (_controllers[index].text.isEmpty &&
//                                             index > 0) {
//                                           setState(() {
//                                             _controllers[index - 1].clear();
//                                           });
//                                           FocusScope.of(context).requestFocus(
//                                               _focusNodes[index - 1]);
//                                           return KeyEventResult.handled;
//                                         }
//                                       }
//                                       return KeyEventResult.ignored;
//                                     },
//                                     child: TextField(
//                                       controller: _controllers[index],
//                                       focusNode: _focusNodes[index],
//                                       keyboardType: TextInputType.number,
//                                       textAlign: TextAlign.center,
//                                       maxLength: 1,
//                                       inputFormatters: [
//                                         FilteringTextInputFormatter.digitsOnly
//                                       ],
//                                       style: TextStyle(
//                                           fontSize: responsive.getFontSize(
//                                               18), // Reduced from 22
//                                           fontWeight: FontWeight.bold),
//                                       decoration: InputDecoration(
//                                         counterText: "",
//                                         border: InputBorder.none,
//                                         contentPadding: EdgeInsets.zero,
//                                       ),
//                                       onChanged: (value) =>
//                                           _onOtpChanged(value, index),
//                                     ),
//                                   ),
//                                   if (_controllers[index].text.isEmpty &&
//                                       !_focusNodes[index].hasFocus)
//                                     SizedBox(
//                                       width: responsive
//                                           .getWidth(18), // Reduced from 24
//                                       height: responsive
//                                           .getHeight(18), // Reduced from 24
//                                       child: CustomPaint(
//                                         painter: DashedLinePainter(),
//                                       ),
//                                     ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         }),
//                       ),
//                     ),

//                     SizedBox(height: responsive.getHeight(30)),
//                     SizedBox(
//                         width:
//                             responsive.getWidth(337), // reduced from 361 -> 337
//                         height: responsive.getHeight(52),
//                         child: ButtonCustom(
//                           onPressed: () {
//                             String otp = _controllers.map((e) => e.text).join();
//                             if (otp.length == 6) {
//                               print("Validating OTP: $otp");
//                             } else {
//                               print("Invalid OTP: $otp");
//                             }
//                           },
//                           text: 'Continue',
//                         )),
//                   ],
//                 ),
//               ),
//             ),

//             // Footer text
//             Positioned(
//               bottom: responsive.getHeight(20),
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: Text.rich(
//                   TextSpan(
//                       text: "Enbraun Technologies Private Limited",
//                       children: [
//                         TextSpan(
//                             text: " © 2025",
//                             style: TextStyle(
//                                 color: Color.fromRGBO(51, 51, 51, 0.5))),
//                       ]),
//                   style: TextStyle(
//                     color: Color.fromRGBO(51, 51, 51, 0.5),
//                     fontSize: responsive.getFontSize(14),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DashedLinePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = Colors.grey
//       ..strokeWidth = 0.5
//       ..style = PaintingStyle.stroke;

//     double dashWidth = 2;
//     double startX = 0;

//     while (startX < size.width) {
//       canvas.drawLine(Offset(startX, size.height / 2),
//           Offset(startX + dashWidth, size.height / 2), paint);
//       startX += dashWidth;
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

import 'package:ers_app/common/widgets/Responsive_Layout.dart';
import 'package:ers_app/common/widgets/buildOvalShapes.dart';
import 'package:ers_app/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TwoFactorAuthScreen extends StatefulWidget {
  @override
  _TwoFactorAuthScreenState createState() => _TwoFactorAuthScreenState();
}

class _TwoFactorAuthScreenState extends State<TwoFactorAuthScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _controllers.length; i++) {
      final int index = i;
      _focusNodes[index].addListener(() {
        setState(() {});
        // if (_focusNodes[index].hasFocus) {
        //   _controllers[index].selection = TextSelection(
        //     baseOffset: 0,
        //     extentOffset: _controllers[index].text.length,
        //   );
        // }
      });
    }
  }

  void _checkButtonEnabled() {
    setState(() {
      _isButtonEnabled =
          _controllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  void _SubmitOtp() {
    String otp = _controllers.map((e) => e.text).join();
    if (otp.length == 6) {
      print("Validating OTP: $otp");
    } else {
      print("Invalid OTP: $otp");
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(
          milliseconds: 200), // Fixed from microseconds to milliseconds
      content: Text("OTP: $otp"),
    ));
  }

  void _onOtpChanged(String value, int index) {
    setState(() {});
    if (value.isNotEmpty) {
      if (index < 5) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      }
    }
    _checkButtonEnabled();
    // setState(() {});
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveLayout(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/bottomCenter.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Decorative left-side oval shape
            Positioned(
              top: responsive.getHeight(103),
              left: responsive.getWidth(-25),
              child: buildOvalShape(
                  responsive, 125, 59, Color.fromRGBO(235, 229, 247, 0.2)),
            ),

            // Decorative right-side oval shape
            Positioned(
              top: responsive.getHeight(187),
              left: responsive.getWidth(310),
              child: buildOvalShape(
                  responsive, 494, 58, Color.fromRGBO(255, 253, 230, 0.5)),
            ),

            // Decorative bottom-right oval shape
            Positioned(
              top: responsive.getHeight(440),
              left: responsive.getWidth(330),
              child: buildOvalShape(
                  responsive, 494, 69, Color.fromRGBO(245, 240, 254, 0.6)),
            ),

            // App logo
            Positioned(
              top: responsive.getHeight(124),
              left: responsive.getWidth(99),
              child: SizedBox(
                width: responsive.getWidth(194),
                height: responsive.getHeight(75),
                child: Image.asset('assets/ers_logo_banner.png',
                    fit: BoxFit.contain),
              ),
            ),

            // Main content
            Positioned(
              top: responsive.getHeight(231),
              left: responsive.getWidth(28),
              child: SizedBox(
                width: responsive.getWidth(337),
                height: responsive.getHeight(300), // Increased height
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Two Factor Authentication",
                      style: TextStyle(
                          fontSize: responsive.getFontSize(22),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: responsive.getHeight(12)),
                    Text(
                      "Enter the 6-digit verification code from your authenticator app.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: responsive.getFontSize(14),
                          color: Color.fromRGBO(51, 51, 51, 0.5)),
                    ),
                    SizedBox(height: responsive.getHeight(21)),

                    // OTP fields - Adjusted to fit within container
                    SizedBox(
                      width: responsive.getWidth(337),
                      height: responsive.getHeight(56),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (index) {
                          bool isFilled = _controllers[index].text.isNotEmpty;
                          // Smaller fixed size for OTP boxes
                          return Container(
                            width: responsive.getWidth(45), // Reduced from 52
                            height: responsive.getHeight(48), // Reduced from 56
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    responsive.getWidth(5)), // Reduced from 5
                            decoration: BoxDecoration(
                              color: isFilled
                                  ? Color.fromRGBO(233, 242, 251, 1)
                                  : Colors.white,
                              border: Border.all(
                                  color: isFilled
                                      ? Colors.blue
                                      : Colors.grey.shade400,
                                  width: responsive.getWidth(0.5)),
                              borderRadius: BorderRadius.circular(
                                  responsive.getRadius(16)),
                            ),
                            child: SizedBox(
                              width: responsive.getWidth(24),
                              height: responsive.getHeight(24),
                              child: Focus(
                                onKeyEvent: (node, event) {
                                  if (event is KeyDownEvent &&
                                      event.logicalKey ==
                                          LogicalKeyboardKey.backspace) {
                                    if (_controllers[index].text.isEmpty &&
                                        index > 0) {
                                      setState(() {
                                        _controllers[index - 1].clear();
                                      });
                                      FocusScope.of(context)
                                          .requestFocus(_focusNodes[index - 1]);
                                      return KeyEventResult.handled;
                                    }
                                  }
                                  return KeyEventResult.ignored;
                                },
                                child: TextField(
                                  controller: _controllers[index],
                                  focusNode: _focusNodes[index],
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  cursorHeight: responsive.getHeight(18),
                                  style: TextStyle(
                                    fontSize: responsive.getFontSize(18),
                                    fontWeight: FontWeight.bold,
                                    height: 1,
                                    color: _controllers[index].text.isEmpty &&
                                            !_focusNodes[index].hasFocus
                                        ? Colors.transparent
                                        : null,
                                  ),
                                  decoration: InputDecoration(
                                    counterText: "",
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: _controllers[index]
                                                .text
                                                .isEmpty &&
                                            !_focusNodes[index].hasFocus
                                        ? '-' // Use em-dash or custom character
                                        : '',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      // letterSpacing: 2,
                                      height: 1,
                                      fontSize: responsive.getFontSize(18),
                                    ),
                                  ),
                                  onChanged: (value) =>
                                      _onOtpChanged(value, index),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    SizedBox(height: responsive.getHeight(30)),
                    SizedBox(
                      width: responsive.getWidth(337),
                      height: responsive.getHeight(52),
                      child: ButtonCustom(
                        onPressed: _isButtonEnabled ? _SubmitOtp : null,
                        text: 'Continue',
                        backgroundColor: _isButtonEnabled
                            ? Color.fromRGBO(28, 121, 212, 1)
                            : Color.fromRGBO(211, 220, 230, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer text
            Positioned(
              bottom: responsive.getHeight(20),
              left: 0,
              right: 0,
              child: Center(
                child: Text.rich(
                  TextSpan(
                      text: "Enbraun Technologies Private Limited",
                      children: [
                        TextSpan(
                            text: " © 2025",
                            style: TextStyle(
                                color: Color.fromRGBO(51, 51, 51, 0.5))),
                      ]),
                  style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 0.5),
                    fontSize: responsive.getFontSize(14),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class DashedLinePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = Colors.grey
//       ..strokeWidth = 0.5
//       ..style = PaintingStyle.stroke;

//     double dashWidth = 2;
//     double startX = 0;

//     while (startX < size.width) {
//       canvas.drawLine(Offset(startX, size.height / 2),
//           Offset(startX + dashWidth, size.height / 2), paint);
//       startX += dashWidth;
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
