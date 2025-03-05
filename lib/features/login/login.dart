// import 'package:ers_app/common/widgets/custom_button.dart';
// import 'package:ers_app/common/widgets/custom_text.dart';
// import 'package:ers_app/common/widgets/custom_textformfield.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   String? _errorMessages;
//   final _loginController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   bool _checkforbutton = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _loginController.addListener(_updateButtonState);
//     _passwordController.addListener(_updateButtonState);
//   }
//
//   @override
//   void dispose() {
//     _loginController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   void _updateButtonState() {
//     setState(() {
//       // Clear errors if they exist for new errors to store
//       if (_errorMessages != null) {
//         _errorMessages = null;
//       }
//
//       // will check for the content been entered or not
//       _checkforbutton = (_loginController.text.isNotEmpty &&
//           _passwordController.text.isNotEmpty);
//     });
//   }
//
//   void _validateFields() {
//     setState(() {
//       _errorMessages = null;
//       //Here we can define the API auth logic
//       if(_loginController.text != "enbraun" || _passwordController.text != "enbraun"){
//         _errorMessages = "Invalid Login or Password";
//       }
//       else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Login done")),
//         );
//       }
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             //for the below banner image
//             Positioned.fill(
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Image.asset(
//                   'assets/bottomCenter.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//
//             //left side oval shape
//             Positioned(
//               top: 103,
//               left: -25,
//               child: Container(
//                 width: 125,
//                 height: 59,
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(235, 229, 247, 0.2),
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//               ),
//             ),
//
//             //right side oval shape
//             Positioned(
//               top: 187,
//               left: 310,
//               child: Container(
//                 width: 494,
//                 height: 58,
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(255, 253, 230, 0.5),
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//               ),
//             ),
//
//             //right below oval shape
//             Positioned(
//               top: 440,
//               left: 330,
//               child: Container(
//                 width: 494,
//                 height: 69,
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(245, 240, 254, 0.6),
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//               ),
//             ),
//
//             Positioned(
//               top: 124.26,
//               left: 99.35,
//               child: SizedBox(
//                 width: 194.3,
//                 height: 74.73,
//                 child: Image.asset(
//                   'assets/ers_logo_banner.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//
//             Positioned(
//               top: 231,
//               left: 80,
//               child: SizedBox(
//                 width: 232,
//                 height: 30,
//                 child: Text(
//                   "Login to your account",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 22,
//                       fontWeight: FontWeight.w400,
//                       letterSpacing: -0.32),
//                 ),
//               ),
//             ),
//
//             Positioned(
//               top: 302,
//               left: 16,
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width - 32,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       Column(
//                         children: [
//                           TextFormFieldCustom(
//                             hintText: "Login",
//                             controller: _loginController,
//                             prefixIcon: Transform.scale(
//                               scale: 0.5,
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: 2, horizontal: 4),
//                                 child: Image.asset(
//                                   "assets/user.png",
//                                   width: 24,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           TextFormFieldCustom(
//                             hintText: "Password",
//                             obscureText: true,
//                             controller: _passwordController,
//                             prefixIcon: Transform.scale(
//                                 scale: 0.5,
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 2, horizontal: 4),
//                                   child: Image.asset(
//                                     "assets/password.png",
//                                     width: 24,
//                                   ),
//                                 )),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 12,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           CustomText(text: "Forgot Login ID?",ontap: (){
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text("Forgot Login ID tapped"),
//                                 duration: Duration(milliseconds: 200),
//                               ),);
//                           },),
//                           CustomText(text: "Forgot Password?",ontap: (){
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text("Forgot Password tapped"),
//                                 duration: Duration(milliseconds: 200),
//                               ),);
//                           },),
//                         ],
//                       ),
//                       SizedBox(
//                         height: (_errorMessages == null) ? 42 : 19,
//                       ),
//                       (_errorMessages != null)
//                           ? Text(
//                         _errorMessages!,
//                         style: TextStyle(
//                           fontFamily: GoogleFonts.inter().fontFamily,
//                           fontWeight: FontWeight.w400,
//                           color: Color.fromRGBO(242, 48, 48, 1),
//                           fontSize: 14,
//                         ),
//                       )
//                           : SizedBox.shrink(),
//                       SizedBox(
//                         height: (_errorMessages == null) ? 0 : 19,
//                       ),
//                       Column(
//                         children: [
//                           ButtonCustom(
//                             onPressed: _checkforbutton ? _validateFields : null,
//                             // here we are doing it disable on basis of the _checkforButton basis
//                             text: "Login",
//                             backgroundColor: _checkforbutton
//                                 ? Color.fromRGBO(3, 125, 221, 1)
//                                 : Color.fromRGBO(211, 220, 230, 1),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           ButtonCustom(
//                             onPressed: () {},
//                             text: "Single Sign on",
//                             backgroundColor: Colors.white,
//                             textColor: Colors.black,
//                             iconAsImage: "assets/sso-icon.png",
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:ers_app/common/widgets/Responsive_Layout.dart';
import 'package:ers_app/common/widgets/custom_button.dart';
import 'package:ers_app/common/widgets/custom_text.dart';
import 'package:ers_app/common/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _checkforbutton = false;
  String? _errorMessages;
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loginController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      // Clear errors if they eixst for new errors to store
      if (_errorMessages != null) {
        _errorMessages = null;
      }

      // will check for the content been entered or not
      _checkforbutton = (_loginController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty);
    });
  }

  void _validateFields() {
    setState(() {
      _errorMessages = null;
      //Here we can define the API auth logic
      if (_loginController.text != "enbraun" ||
          _passwordController.text != "enbraun") {
        _errorMessages = "Invalid Login or Password";
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homescreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveLayout(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
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
              child: Container(
                width: responsive.getWidth(125),
                height: responsive.getHeight(59),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(235, 229, 247, 0.2),
                  borderRadius: BorderRadius.circular(responsive.getRadius(50)),
                ),
              ),
            ),

            //right side oval shape
            Positioned(
              top: responsive.getHeight(187),
              left: responsive.getWidth(310),
              child: Container(
                width: responsive.getWidth(494),
                height: responsive.getHeight(58),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 253, 230, 0.5),
                  borderRadius: BorderRadius.circular(responsive.getRadius(50)),
                ),
              ),
            ),

            //right below oval shape
            Positioned(
              top: responsive.getHeight(440),
              left: responsive.getWidth(330),
              child: Container(
                width: responsive.getWidth(494),
                height: responsive.getHeight(69),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 240, 254, 0.6),
                  borderRadius: BorderRadius.circular(responsive.getRadius(50)),
                ),
              ),
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
              left: responsive.getWidth(80),
              child: SizedBox(
                width: responsive.getWidth(232),
                height: responsive.getHeight(30),
                child: Text(
                  "Login to your account",
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
                    MediaQuery.of(context).size.width - responsive.getWidth(32),
                child: Padding(
                  padding: EdgeInsets.all(responsive.getWidth(16.0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          TextFieldCustom(
                            hintText: "Login",
                            obscureText: false,
                            controller: _loginController,
                            prefixIcon: Transform.scale(
                              scale: 0.5,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: responsive.getHeight(2),
                                    horizontal: responsive.getWidth(4)),
                                child: Image.asset(
                                  "assets/user.png",
                                  width: responsive.getWidth(24),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: responsive.getHeight(20),
                          ),
                          TextFieldCustom(
                            hintText: "Password",
                            obscureText: true,
                            controller: _passwordController,
                            prefixIcon: Transform.scale(
                                scale: 0.5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: responsive.getHeight(2),
                                      horizontal: responsive.getWidth(4)),
                                  child: Image.asset(
                                    "assets/password.png",
                                    width: responsive.getWidth(24),
                                  ),
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: responsive.getHeight(12),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Forgot Login ID?",
                            ontap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Forgot Login ID tapped"),
                                  duration: Duration(milliseconds: 200),
                                ),
                              );
                            },
                          ),
                          CustomText(
                            text: "Forgot Password?",
                            ontap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Forgot Password tapped"),
                                  duration: Duration(milliseconds: 200),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
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
                            text: "Login",
                            // elevation: 5,
                            backgroundColor: _checkforbutton
                                ? Color.fromRGBO(3, 125, 221, 1)
                                : Color.fromRGBO(211, 220, 230, 1),
                          ),
                          SizedBox(
                            height: responsive.getHeight(20),
                          ),
                          ButtonCustom(
                            onPressed: () {},
                            text: "Single Sign on",
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            iconAsImage: "assets/sso-icon.png",
                          ),
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
              child: Center(
                child: SizedBox(
                  width: responsive.getWidth(314),
                  height: responsive.getHeight(39),
                  child: Text(
                    "Enbraun Technologies Private Limited.",
                    style: TextStyle(
                      color: Color.fromRGBO(51, 51, 51, 0.5),
                      fontSize: responsive.getFontSize(14),
                    ),
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
