import 'package:ers_app/common/theme/themeData.dart';
import 'package:ers_app/features/forgot%20password/screens/forgot_password.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eResources Scheduler',
      theme: appTheme,
      home: ForgotPasswordScreen(),
    );
  }
}
