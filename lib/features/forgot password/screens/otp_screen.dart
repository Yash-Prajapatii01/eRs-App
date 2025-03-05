import 'package:ers_app/common/widgets/Responsive_Layout.dart';
import 'package:ers_app/common/widgets/buildOvalShapes.dart';
import 'package:ers_app/common/widgets/custom_button.dart';
import 'package:ers_app/common/widgets/custom_textformfield.dart';
import 'package:ers_app/features/forgot%20password/screens/save_password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  String? _errorMessage;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _otpController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  /// Updates the button state based on OTP input
  void _updateButtonState() {
    setState(() {
      _errorMessage = null; // Clear any existing error message
      _isButtonEnabled = _otpController.text.isNotEmpty;
    });
  }

  /// Validates the OTP and navigates accordingly
  void _validateOTP() {
    setState(() {
      _errorMessage = null; // Clear previous errors

      if (_otpController.text != "123456") {
        _errorMessage = "Invalid OTP. Please try again.";
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SavePasswordScreen()), // Correct screen navigation
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

            // OTP input section
            Positioned(
              top: responsive.getHeight(231),
              left: responsive.getWidth(40),
              right: responsive.getWidth(40),
              child: Column(
                children: [
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: responsive.getFontSize(22),
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.32,
                    ),
                  ),
                  SizedBox(height: responsive.getHeight(12)),
                  Text(
                    "A 6-digit verification code was sent\nto ••••••@enbraun.com.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: responsive.getFontSize(14),
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.32,
                    ),
                  ),
                  SizedBox(height: responsive.getHeight(24)),
                  // OTP Input Field
                  TextFieldCustom(
                    hintText: "Enter your 6-digit OTP",
                    obscureText: false,
                    controller: _otpController,
                  ),
                  SizedBox(height: responsive.getHeight(42)),

                  // Error Message (if any)
                  // if (_errorMessage != null)
                  //   Padding(
                  //     padding: EdgeInsets.symmetric(
                  //         vertical: responsive.getHeight(8)),
                  //     child: Text(
                  //       _errorMessage!,
                  //       style: TextStyle(
                  //         color: Colors.red,
                  //         fontSize: responsive.getFontSize(14),
                  //         fontWeight: FontWeight.w400,
                  //       ),
                  //     ),
                  //   ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the code? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: responsive.getFontSize(14),
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.32,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Resend OTP tapped"),
                              duration: Duration(milliseconds: 200),
                            ),
                          );
                        },
                        child: Text(
                          " Resend again",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff037dff),
                            fontSize: responsive.getFontSize(14),
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.32,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: responsive.getHeight(24)),

                  SizedBox(
                    height: (_errorMessage == null)
                        ? responsive.getHeight(24)
                        : responsive.getHeight(19),
                  ),
                  (_errorMessage != null)
                      ? Text(
                          _errorMessage!,
                          style: TextStyle(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(242, 48, 48, 1),
                            fontSize: responsive.getFontSize(14),
                          ),
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    height:
                        (_errorMessage == null) ? 0 : responsive.getHeight(19),
                  ),

                  // OTP Verification Button
                  ButtonCustom(
                    onPressed: _isButtonEnabled ? _validateOTP : null,
                    text: "Verify OTP",
                    backgroundColor: _isButtonEnabled
                        ? Color.fromRGBO(3, 125, 221, 1)
                        : Color.fromRGBO(211, 220, 230, 1),
                  ),
                  SizedBox(
                    height: responsive.getHeight(10),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: responsive.getHeight(52),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor:
                            Colors.transparent, // same default background color
                        padding: EdgeInsets.all(
                            responsive.getWidth(10)), // responsive padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(responsive
                              .getRadius(4)), // responsive border radius
                        ),
                      ),
                      child: Text(
                        "login",
                        style: TextStyle(
                          color: Colors.black, // default text color
                          fontWeight: FontWeight.w500,
                          fontSize: responsive
                              .getFontSize(16), // responsive font size
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
