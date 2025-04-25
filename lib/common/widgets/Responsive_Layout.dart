import 'package:flutter/material.dart';

class ResponsiveLayout {
  final BuildContext context;
  final Size designSize; // Figma canvas size

  ResponsiveLayout(this.context,
      {this.designSize = const Size(393, 852)}); // Assuming iPhone design size

  double getWidth(double width) {
    return MediaQuery.of(context).size.width * (width / designSize.width);
  }

  double getHeight(double height) {
    return MediaQuery.of(context).size.height * (height / designSize.height);
  }

  double getFontSize(double size) {
    return (MediaQuery.of(context).size.width / designSize.width) * size;
  }

  double getRadius(double radius) {
    return (MediaQuery.of(context).size.width / designSize.width) * radius;
  }
}
