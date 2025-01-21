import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color color;
  final double? width;
  final double? height;
  final TextStyle? labelStyle;

  CustomElevatedButton(
      {required this.label,
      required this.onPressed,
      this.borderRadius = 8.0,
      this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      this.color = Colors.blue,
      this.width,
      this.height,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius),
          ),
          padding: padding, 
        ),
        child: Text(
          label,
          style: labelStyle,
        ),
      ),
    );
  }
}
