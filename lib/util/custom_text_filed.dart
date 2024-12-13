import 'package:babylon_task/util/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    this.hint,
    this.label,
    this.keyboardType,
  });
  final String? hint;
  final String? label;
  final TextInputType? keyboardType;
  final bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        labelStyle: AppFonts.stylew40014,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
