import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


import 'package:ers_app/common/widgets/Responsive_Layout.dart';
import 'package:ers_app/common/widgets/buildOvalShapes.dart';

class SuccessScreen extends StatefulWidget {
  final String message;
  const SuccessScreen(
      {super.key,
      this.message =
          "Your password has been updated successfully.Use your new password to log in securely."});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveLayout(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
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

            // // App logo
            // Positioned(
            //   top: responsive.getHeight(124),
            //   left: responsive.getWidth(99),
            //   child: SizedBox(
            //     width: responsive.getWidth(194),
            //     height: responsive.getHeight(75),
            //     child: Image.asset('assets/ers_logo_banner.png',
            //         fit: BoxFit.contain),
            //   ),
            // ),

            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     // Demo GIF (Replace with your own later)
            //     Image.asset(
            //       'assets/demo.gif', // Replace with your GIF path
            //       width: responsive.getWidth(150),
            //       height: responsive.getHeight(150),
            //       fit: BoxFit.cover,
            //     ),
            //     SizedBox(height: responsive.getHeight(20)),

            //     // Success Text
            //     Text(
            //       "Success!",
            //       style: GoogleFonts.poppins(
            //         fontSize: responsive.getFontSize(24),
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black,
            //       ),
            //     ),
            //     SizedBox(height: responsive.getHeight(10)),
            //     Padding(
            //       padding:
            //           EdgeInsets.symmetric(horizontal: responsive.getWidth(20)),
            //       child: Text(
            //         "Your password has been updated successfully. Use your new password to log in securely.",
            //         textAlign: TextAlign.center,
            //         style: GoogleFonts.poppins(
            //           fontSize: responsive.getFontSize(16),
            //           color: Colors.black54,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            Positioned(
                top: responsive.getHeight(211),
                left: responsive.getWidth(141),
                child: Center(
                  child: SizedBox(
                    width: responsive.getWidth(111),
                    // height: responsive.getHeight(111),
                    child: Lottie.asset('assets/success.lottie',
                        animate: true,
                        repeat: true,
                        reverse: false,
                        frameRate: FrameRate.max,
                        options: LottieOptions(
                          enableMergePaths: true,
                        )),
                  ),
                )),

            Positioned(
              top: responsive.getHeight(346),
              left: responsive.getWidth(22),
              child: SizedBox(
                width: responsive.getWidth(348),
                // height: responsive.getHeight(104),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Success!",
                      style: GoogleFonts.poppins(
                          fontSize: responsive.getFontSize(22),
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                    SizedBox(height: responsive.getHeight(12)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsive.getWidth(19)),
                      child: SizedBox(
                        width: responsive.getWidth(310),
                        // height: responsive.getHeight(63),
                        child: Text(
                          widget.message,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: responsive.getFontSize(15),
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(51, 51, 51, 1)),
                        ),
                      ),
                    ),
                  ],
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


// import 'package:ers_app/common/widgets/Responsive_Layout.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SuccessScreen extends StatefulWidget {
//   @override
//   _SuccessScreenState createState() => _SuccessScreenState();
// }

// class _SuccessScreenState extends State<SuccessScreen> with TickerProviderStateMixin {
//   late AnimationController _positionController;
//   late AnimationController _fadeController;
//   late Animation<double> _fadeAnimation;
//   late Animation<double> _lottieTopPosition;
  
//   @override
//   void initState() {
//     super.initState();

//     // Initialize animation controllers
//     _positionController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     );

//     _fadeController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500),
//     );
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     final double screenHeight = MediaQuery.of(context).size.height;

//     // Define animation for Lottie moving from bottom to final position
//     _lottieTopPosition = Tween<double>(
//       begin: screenHeight, // Start from bottom of the screen
//       end: 211, // Final position
//     ).animate(
//       CurvedAnimation(
//         parent: _positionController,
//         curve: Curves.easeOut,
//       ),
//     );

//     // Text fade-in animation
//     _fadeAnimation = CurvedAnimation(
//       parent: _fadeController,
//       curve: Curves.easeIn,
//     );

//     // Start animations after a small delay
//     Future.delayed(Duration(milliseconds: 500), () {
//       _positionController.forward().then((_) {
//         _fadeController.forward();
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _positionController.dispose();
//     _fadeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final responsive = ResponsiveLayout(context); // Assuming you have a responsive helper

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Lottie animation moving from bottom to final position
//           AnimatedBuilder(
//             animation: _positionController,
//             builder: (context, child) {
//               return Positioned(
//                 top: responsive.getHeight(_lottieTopPosition.value),
//                 left: responsive.getWidth(141),
//                 child: Center(
//                   child: SizedBox(
//                     width: responsive.getWidth(111),
//                     child: Lottie.asset(
//                       'assets/success.lottie',
//                       animate: true,
//                       repeat: true,
//                       reverse: false,
//                       frameRate: FrameRate.max,
//                       options: LottieOptions(enableMergePaths: true),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),

//           // Text appearing with fade effect after Lottie animation
//           Positioned(
//             top: responsive.getHeight(346),
//             left: responsive.getWidth(22),
//             child: FadeTransition(
//               opacity: _fadeAnimation,
//               child: SizedBox(
//                 width: responsive.getWidth(348),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Success!",
//                       style: GoogleFonts.poppins(
//                         fontSize: responsive.getFontSize(22),
//                         fontWeight: FontWeight.w500,
//                         color: Color.fromRGBO(51, 51, 51, 1),
//                       ),
//                     ),
//                     SizedBox(height: responsive.getHeight(12)),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: responsive.getWidth(19)),
//                       child: SizedBox(
//                         width: responsive.getWidth(310),
//                         child: Text(
//                           "Your password has been updated successfully. Use your new password to log in securely.",
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.poppins(
//                             fontSize: responsive.getFontSize(15),
//                             fontWeight: FontWeight.w400,
//                             color: Color.fromRGBO(51, 51, 51, 1),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
