import 'package:flutter/material.dart';

class CustomPostTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextInputType? keyboardType;

  const CustomPostTextFeild({
    Key? key,
    required this.controller,
    required this.label,
    this.hint,
    this.validator,
    this.maxLines = 1,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
      ),
      validator: validator,
    );
  }
}
