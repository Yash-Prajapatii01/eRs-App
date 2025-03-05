import 'package:ers_app/common/widgets/Responsive_Layout.dart';
import 'package:flutter/material.dart';

Widget buildOvalShape(
    ResponsiveLayout responsive, double width, double height, Color color) {
  return Container(
    width: responsive.getWidth(width),
    height: responsive.getHeight(height),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(responsive.getRadius(50)),
    ),
  );
}
