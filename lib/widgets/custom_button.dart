import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  const CustomButton({required this.child, this.width, this.height, super.key});

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(120);
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5cefb0),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
