import 'package:ers_app/common/common_screens/success_screen.dart';
import 'package:ers_app/common/widgets/Responsive_Layout.dart';
import 'package:ers_app/common/widgets/buildOvalShapes.dart';
import 'package:ers_app/common/widgets/custom_button.dart';
import 'package:ers_app/common/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotLoginId extends StatefulWidget {
  const ForgotLoginId({super.key});

  @override
  State<ForgotLoginId> createState() => _ForgotLoginIdState();
}

class _ForgotLoginIdState extends State<ForgotLoginId> {
  String? _errorMessages;
  final _emailController = TextEditingController();

  bool _checkforbutton = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      // Clear errors if they eixst for new errors to store
      if (_errorMessages != null) {
        _errorMessages = null;
      }

      // will check for the content been entered or not
      _checkforbutton = (_emailController.text.trim().isNotEmpty);
    });
  }

  void _validateFields() {
    setState(() {
      _errorMessages = null;
      String email = _emailController.text.trim();

      // Regular expression for a valid email format
      final emailRegex =
          RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

      if (email == "enbraun@enbraun.com") {
        // Special test case: Navigate to the next screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SuccessScreen(
              message: "Your login ID has been sent to your email address. Check your email for the login ID.",
            )));
      } else if (!emailRegex.hasMatch(email)) {
        _errorMessages = "Invalid email format!";
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Congratulations and bye"),)
       );   // Proceed with authentication logic
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
          alignment: Alignment.center,
          children: [
            //for the below banner image
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/bottomCenter.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //left side oval shape
            Positioned(
              top: responsive.getHeight(103),
              left: responsive.getWidth(-25),
              child: buildOvalShape(
                  responsive, 125, 59, Color.fromRGBO(235, 229, 247, 0.2)),
            ),

            //right side oval shape
            Positioned(
              top: responsive.getHeight(187),
              left: responsive.getWidth(310),
              child: buildOvalShape(
                  responsive, 494, 58, Color.fromRGBO(255, 253, 230, 0.5)),
            ),

            //right below oval shape
            Positioned(
              top: responsive.getHeight(440),
              left: responsive.getWidth(330),
              child: buildOvalShape(
                  responsive, 494, 69, Color.fromRGBO(245, 240, 254, 0.6)),
            ),

            //left below oval shape
            Positioned(
              top: responsive.getHeight(348),
              left: responsive.getWidth(-410),
              child: buildOvalShape(
                  responsive, 494, 59, Color.fromRGBO(242, 249, 255, 1)),
            ),

            Positioned(
              top: responsive.getHeight(124.26),
              left: responsive.getWidth(99.35),
              child: SizedBox(
                width: responsive.getWidth(194.3),
                height: responsive.getHeight(74.73),
                child: Image.asset(
                  'assets/ers_logo_banner.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Positioned(
              top: responsive.getHeight(231),
              left: responsive.getWidth(107),
              child: SizedBox(
                width: responsive.getWidth(178),
                height: responsive.getHeight(30),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: responsive.getFontSize(22),
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.32),
                ),
              ),
            ),

            Positioned(
              top: responsive.getHeight(302),
              left: responsive.getWidth(16),
              child: SizedBox(
                width:
                    MediaQuery.of(context).size.width - responsive.getWidth(41),
                child: Padding(
                  padding: EdgeInsets.all(responsive.getWidth(16.0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          TextFieldCustom(
                            hintText: "Email",
                            obscureText: false,
                            controller: _emailController,
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: responsive.getHeight(12),
                      // ),
                      // // Replace the Row with a Column
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Container(
                      //       width: MediaQuery.of(context).size.width -
                      //           responsive.getWidth(64),
                      //       child: Text.rich(
                      //         TextSpan(
                      //           children: <TextSpan>[
                      //             TextSpan(
                      //                 text: "Note: ",
                      //                 style: TextStyle(
                      //                   fontFamily:
                      //                       GoogleFonts.poppins().fontFamily,
                      //                   fontWeight: FontWeight.bold,
                      //                   color: Colors.black,
                      //                   fontSize: responsive.getFontSize(14),
                      //                 )),
                      //             TextSpan(
                      //                 text:
                      //                     "Login ID might not be same as email address.",
                      //                 style: TextStyle(
                      //                   fontFamily:
                      //                       GoogleFonts.poppins().fontFamily,
                      //                   color: Colors.black,
                      //                   fontSize: responsive.getFontSize(14),
                      //                 )),
                      //           ],
                      //         ),
                      //         softWrap: true,
                      //         overflow: TextOverflow.visible,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: (_errorMessages == null)
                            ? responsive.getHeight(42)
                            : responsive.getHeight(19),
                      ),
                      (_errorMessages != null)
                          ? Text(
                              _errorMessages!,
                              style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(242, 48, 48, 1),
                                fontSize: responsive.getFontSize(14),
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: (_errorMessages == null)
                            ? 0
                            : responsive.getHeight(19),
                      ),
                      Column(
                        children: [
                          ButtonCustom(
                            onPressed: _checkforbutton ? _validateFields : null,
                            // here we are doing it disable on basis of the _checkforButton basis
                            text: "Submit",
                            backgroundColor: _checkforbutton
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
                              onPressed: () {
                                //here yoou can navigate to the login page
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors
                                    .transparent, // same default background color
                                padding: EdgeInsets.all(responsive
                                    .getWidth(10)), // responsive padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      responsive.getRadius(
                                          4)), // responsive border radius
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
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: responsive.getHeight(780),
              left: responsive.getWidth(39),
              child: SizedBox(
                width: responsive.getWidth(314),
                height: responsive.getHeight(39),
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
