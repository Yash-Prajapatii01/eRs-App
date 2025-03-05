// import 'package:ers_app/HomeScreen.dart';
// import 'package:ers_app/common/widgets/Responsive_Layout.dart';
// import 'package:ers_app/common/widgets/custom_button.dart';
// import 'package:ers_app/common/widgets/custom_textformfield.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SavePasswordScreen extends StatefulWidget {
//   const SavePasswordScreen({super.key});

//   @override
//   State<SavePasswordScreen> createState() => _SavePasswordScreenState();
// }

// class _SavePasswordScreenState extends State<SavePasswordScreen> {
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   String? _errorMessage;
//   bool _isButtonEnabled = false;

//   @override
//   void initState() {
//     super.initState();
//     _confirmPasswordController.addListener(_updateButtonState);
//     _passwordController.addListener(_updateButtonState);
//   }

//   @override
//   void dispose() {
//     _confirmPasswordController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   /// Updates the button state based on OTP input
//   void _updateButtonState() {
//     setState(() {
//       _errorMessage = null; // Clear any existing error message
//       _isButtonEnabled = _confirmPasswordController.text.isNotEmpty &&
//           _passwordController.text.isNotEmpty;
//     });
//   }

//   /// Validates the OTP and navigates accordingly
//   void _validateSavePassword() {
//     setState(() {
//       _errorMessage = null; // Clear previous errors

//       String password = _passwordController.text;
//       String confirmPassword = _confirmPasswordController.text;

//       RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

//       if (password.length < 8) {
//         _errorMessage = 'Password should be at least 8 characters long';
//       } else if (!specialCharRegex.hasMatch(password)) {
//         _errorMessage = 'Password must include at least one special character';
//       } else if (confirmPassword != password) {
//         _errorMessage = "The Confirm Password does not match";
//       } else {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Homescreen()),
//         );
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final responsive = ResponsiveLayout(context);

//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Background image at the bottom
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
//               child: _buildOvalShape(
//                   responsive, 125, 59, Color.fromRGBO(235, 229, 247, 0.2)),
//             ),

//             // Decorative right-side oval shape
//             Positioned(
//               top: responsive.getHeight(187),
//               left: responsive.getWidth(310),
//               child: _buildOvalShape(
//                   responsive, 494, 58, Color.fromRGBO(255, 253, 230, 0.5)),
//             ),

//             // Decorative bottom-right oval shape
//             Positioned(
//               top: responsive.getHeight(440),
//               left: responsive.getWidth(330),
//               child: _buildOvalShape(
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

//             //  input section
//             Positioned(
//               top: responsive.getHeight(231),
//               left: responsive.getWidth(40),
//               right: responsive.getWidth(40),
//               child: Column(
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         "Set New Password",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: responsive.getFontSize(22),
//                           fontWeight: FontWeight.w500,
//                           letterSpacing: -0.32,
//                         ),
//                       ),
//                       SizedBox(height: responsive.getHeight(12)),
//                       Text(
//                         "Set the new password for your account so\nyou can login and access.",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontSize: responsive.getFontSize(14),
//                           fontWeight: FontWeight.w500,
//                           letterSpacing: -0.32,
//                         ),
//                       ),
//                       SizedBox(height: responsive.getHeight(24)),
//                       //
//                       TextFieldCustom(
//                         hintText: "Create new password",
//                         obscureText: false,
//                         controller: _passwordController,
//                       ),
//                       SizedBox(height: responsive.getHeight(8)),
//                       // SizedBox(
//                       //     width: ResponsiveLayout(context).getWidth(361),
//                       //     height: ResponsiveLayout(context).getHeight(18),
//                       //     child: Text(
//                       //       "Length 8-50 with numbers and special characters.",
//                       //     )),
//                       SizedBox(
//                         width: double.infinity,
//                         child: Text(
//                           "Length 8-50 with numbers and special characters.",
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                             fontSize: responsive.getFontSize(12),
//                             color: Colors.black54,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: responsive.getHeight(20)),
//                       TextFieldCustom(
//                         hintText: "Confirm new password",
//                         obscureText: false,
//                         controller: _confirmPasswordController,
//                       ),
//                       // Error Message (if any)
//                       // if (_errorMessage != null)
//                       //   Padding(
//                       //     padding: EdgeInsets.symmetric(
//                       //         vertical: responsive.getHeight(8)),
//                       //     child: Text(
//                       //       _errorMessage!,
//                       //       style: TextStyle(
//                       //         color: Colors.red,
//                       //         fontSize: responsive.getFontSize(14),
//                       //         fontWeight: FontWeight.w400,
//                       //       ),
//                       //     ),
//                       //   ),

//                       // SizedBox(height: responsive.getHeight(24)),
//                     ],
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: (_errorMessage == null)
//                             ? responsive.getHeight(42)
//                             : responsive.getHeight(19),
//                       ),
//                       Center(
//                         child: (_errorMessage != null)
//                             ? Text(
//                                 _errorMessage!,
//                                 style: TextStyle(
//                                   fontFamily: GoogleFonts.inter().fontFamily,
//                                   fontWeight: FontWeight.w400,
//                                   color: Color.fromRGBO(242, 48, 48, 1),
//                                   fontSize: responsive.getFontSize(14),
//                                 ),
//                               )
//                             : SizedBox.shrink(),
//                       ),
//                       SizedBox(
//                         height: (_errorMessage == null)
//                             ? 0
//                             : responsive.getHeight(19),
//                       ),

//                       // OTP Verification Button
//                       ButtonCustom(
//                         onPressed:
//                             _isButtonEnabled ? _validateSavePassword : null,
//                         text: "Save Change",
//                         backgroundColor: _isButtonEnabled
//                             ? Color.fromRGBO(3, 125, 221, 1)
//                             : Color.fromRGBO(211, 220, 230, 1),
//                       ),
//                       SizedBox(
//                         height: responsive.getHeight(10),
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         height: responsive.getHeight(52),
//                         child: TextButton(
//                           onPressed: () {},
//                           style: TextButton.styleFrom(
//                             backgroundColor: Colors
//                                 .transparent, // same default background color
//                             padding: EdgeInsets.all(
//                                 responsive.getWidth(10)), // responsive padding
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(responsive
//                                   .getRadius(4)), // responsive border radius
//                             ),
//                           ),
//                           child: Text(
//                             "login",
//                             style: TextStyle(
//                               color: Colors.black, // default text color
//                               fontWeight: FontWeight.w500,
//                               fontSize: responsive
//                                   .getFontSize(16), // responsive font size
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Helper method to create oval shapes
//   Widget _buildOvalShape(
//       ResponsiveLayout responsive, double width, double height, Color color) {
//     return Container(
//       width: responsive.getWidth(width),
//       height: responsive.getHeight(height),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(responsive.getRadius(50)),
//       ),
//     );
//   }
// }

import 'package:ers_app/HomeScreen.dart';
import 'package:ers_app/common/widgets/Responsive_Layout.dart';
import 'package:ers_app/common/widgets/buildOvalShapes.dart';
import 'package:ers_app/common/widgets/custom_button.dart';
import 'package:ers_app/common/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavePasswordScreen extends StatefulWidget {
  const SavePasswordScreen({super.key});

  @override
  State<SavePasswordScreen> createState() => _SavePasswordScreenState();
}

class _SavePasswordScreenState extends State<SavePasswordScreen> {
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorMessage;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _confirmPasswordController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Updates the button state based on input
  void _updateButtonState() {
    setState(() {
      _errorMessage = null; // Clear any existing error message
      _isButtonEnabled = _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty;
    });
  }

  /// Validates the password and navigates accordingly
  void _validateSavePassword() {
    setState(() {
      _errorMessage = null; // Clear previous errors

      String password = _passwordController.text;
      String confirmPassword = _confirmPasswordController.text;

      RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

      if (password.length < 8) {
        _errorMessage = 'Password should be at least 8 characters long.';
      } else if (!specialCharRegex.hasMatch(password)) {
        _errorMessage = 'Password must include at least one special character.';
      } else if (confirmPassword != password) {
        _errorMessage = "The Confirm Password does not match.";
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Homescreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveLayout(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            // Background image at the bottom
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

            // Password input section
            Positioned(
              top: responsive.getHeight(231),
              left: responsive.getWidth(40),
              right: responsive.getWidth(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Set New Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: responsive.getFontSize(22),
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.32,
                    ),
                  ),
                  SizedBox(height: responsive.getHeight(12)),
                  SizedBox(
                    width: responsive.getWidth(315),
                    height: responsive.getHeight(42),
                    child: Text(
                      "Set the new password for your account \nso you can login and access.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 0.7),
                        fontSize: responsive.getFontSize(14),
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.32,
                      ),
                    ),
                  ),
                  SizedBox(height: responsive.getHeight(24)),

                  TextFieldCustom(
                    hintText: "Create new password",
                    obscureText: false,
                    controller: _passwordController,
                  ),
                  SizedBox(height: responsive.getHeight(8)),

                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Length 8-50 with numbers and special characters.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: responsive.getFontSize(12),
                        color: Color.fromRGBO(51, 51, 51, 0.7),
                      ),
                    ),
                  ),

                  SizedBox(height: responsive.getHeight(20)),

                  TextFieldCustom(
                    hintText: "Confirm new password",
                    obscureText: false,
                    controller: _confirmPasswordController,
                  ),

                  SizedBox(
                      height: (_errorMessage == null)
                          ? responsive.getHeight(42)
                          : responsive.getHeight(16)),

                  // Error Message Container
                  Center(
                    child: _errorMessage != null
                        ? Text(
                            _errorMessage!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(242, 48, 48, 1),
                              fontSize: responsive.getFontSize(14),
                            ),
                          )
                        : SizedBox.shrink(),
                  ),

                  SizedBox(
                      height: (_errorMessage == null)
                          ? responsive.getHeight(0)
                          : responsive.getHeight(16)),

                  // OTP Verification Button
                  ButtonCustom(
                    onPressed: _isButtonEnabled ? _validateSavePassword : null,
                    text: "Save Change",
                    backgroundColor: _isButtonEnabled
                        ? Color.fromRGBO(3, 125, 221, 1)
                        : Color.fromRGBO(211, 220, 230, 1),
                  ),

                  SizedBox(height: responsive.getHeight(10)),

                  SizedBox(
                    width: double.infinity,
                    height: responsive.getHeight(52),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.all(responsive.getWidth(10)),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(responsive.getRadius(4)),
                        ),
                      ),
                      child: Text(
                        "login",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: responsive.getFontSize(16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to create oval shapes
  // Widget _buildOvalShape(
  //     ResponsiveLayout responsive, double width, double height, Color color) {
  //   return Container(
  //     width: responsive.getWidth(width),
  //     height: responsive.getHeight(height),
  //     decoration: BoxDecoration(
  //       color: color,
  //       borderRadius: BorderRadius.circular(responsive.getRadius(50)),
  //     ),
  //   );
  // }
}
