import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String label;
  final String? Sublabel;
  const TextWidget({required this.label, this.Sublabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          Sublabel ?? '',
          style: TextStyle(color: Colors.black, fontSize: 18),
        )
      ],
    );
  }
}
