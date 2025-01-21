import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  String? selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = DateFormat('yyyy-MM-dd').format(picked);
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(selectedDate!);
      }
      widget.controller.text =
          selectedDate!; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          TextFormField(
            controller: widget.controller,
            keyboardType: widget.inputType, 
            validator: widget.validator,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: widget.isDatePicker
                  ? IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _pickDate(context),
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
        ],
      ),
    );
  }
}
