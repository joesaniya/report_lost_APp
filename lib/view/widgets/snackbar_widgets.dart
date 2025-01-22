import 'package:flutter/material.dart';

void showAnimatedSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        const Icon(Icons.info, color: Colors.white),
        const SizedBox(width: 8),
        Expanded(
          child: AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 500),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.blueAccent,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
