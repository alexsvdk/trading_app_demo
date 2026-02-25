import 'package:flutter/material.dart';

class BottomNavBarClipper extends CustomClipper<Path> {
  final double cutoutRadius; // Radius of the cutout
  final double cutoutWidth; // Width of the cutout
  final double cutoutDepth;
  final double multiplier;

  BottomNavBarClipper({
    this.cutoutRadius = 20.0,
    this.cutoutWidth = 120.0,
    this.cutoutDepth = 24.0,
    this.multiplier = 1.1,
  }); // Depth of the cutout

  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;
    final cutoutRadius = this.cutoutRadius * multiplier;
    final cutoutDepth = this.cutoutDepth * multiplier;
    final cutoutWidth = this.cutoutWidth * multiplier;

    final Path path = Path()
      ..moveTo(0, 0) // Start at the top-left corner
      ..lineTo(width * 0.5 - cutoutWidth / 2, 0) // Move to the left edge of the cutout

      // Create the top-left smooth rounded corner using quadraticBezier
      ..quadraticBezierTo(
        width * 0.5 - cutoutWidth / 2 + cutoutRadius * 0.5,
        0, // Control point
        width * 0.5 - cutoutWidth / 2 + cutoutRadius,
        cutoutDepth,
      ) // Endpoint of the curve

      // Create the bottom center curve of the cutout using another quadraticBezier
      ..quadraticBezierTo(
        width * 0.5,
        cutoutDepth + cutoutRadius, // Control point
        width * 0.5 + cutoutWidth / 2 - cutoutRadius,
        cutoutDepth,
      ) // Endpoint of the center curve

      // Create the top-right smooth rounded corner using quadraticBezier
      ..quadraticBezierTo(
        width * 0.5 + cutoutWidth / 2 - cutoutRadius * 0.5,
        0, // Control point
        width * 0.5 + cutoutWidth / 2,
        0,
      ) // Endpoint of the right corner

      ..lineTo(width, 0) // Move to the top-right corner
      ..lineTo(width, height) // Move to the bottom-right corner
      ..lineTo(0, height) // Move to the bottom-left corner
      ..close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    if (oldClipper is BottomNavBarClipper) {
      if (oldClipper.cutoutRadius != cutoutRadius) {
        return true;
      }
      if (oldClipper.cutoutDepth != cutoutDepth) {
        return true;
      }
      if (oldClipper.cutoutWidth != cutoutWidth) {
        return true;
      }
      if (oldClipper.multiplier != multiplier) {
        return true;
      }
    } else {
      return true;
    }

    return false;
  }
}
