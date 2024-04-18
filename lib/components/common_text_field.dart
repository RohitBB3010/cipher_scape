import 'package:flutter/material.dart';

class CustomTextField extends TextFormField {
  final String? prefixText;
  final IconData? prefixIcon;
  final String? hintText;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final bool? isEnabled;

  CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.prefixText,
    this.onChanged,
    this.controller,
    this.isEnabled,
  }) : super(
            enabled: isEnabled ?? true,
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  prefixIcon,
                  color: Colors.white,
                ),
                fillColor: Colors.white,
                hintText: hintText,
                prefixText: prefixText,
                hintStyle: const TextStyle(color: Colors.white),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.white))));
}
