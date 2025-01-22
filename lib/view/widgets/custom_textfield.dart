import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType inputType;
  final IconData? suffixIcon;
  final bool isDatePicker;
  final Function(String)? onDateSelected;
  final Color? backgroundColor;
  final int? maxLines;

  CustomTextField({
    required this.label,
    required this.hintText,
    required this.controller,
    this.validator,
    this.inputType = TextInputType.text,
    this.suffixIcon,
    this.isDatePicker = false,
    this.onDateSelected,
    this.backgroundColor = Colors.grey,
    this.maxLines = 1,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isAnimated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isAnimated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedOpacity(
            opacity: isAnimated ? 1.0 : 0.0,
            duration: Duration(seconds: 1),
            child: Text(
              widget.label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          AnimatedOpacity(
            opacity: isAnimated ? 1.0 : 0.0,
            duration: Duration(seconds: 1),
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.inputType,
              validator: widget.validator,
              maxLines: widget.maxLines,
              decoration: InputDecoration(
                hintText: widget.hintText,
                suffixIcon: widget.isDatePicker
                    ? IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {},
                      )
                    : (widget.suffixIcon != null
                        ? Icon(widget.suffixIcon)
                        : null),
                fillColor: widget.backgroundColor,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
