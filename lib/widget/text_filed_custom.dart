import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final IconData? prefixIcon;
  final IconData? sufficIcon;
  final String title;
  final String hint;

  const TextFieldCustom({
    super.key,
    this.prefixIcon,
    this.sufficIcon,
    required this.title,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon,
                color: Colors.black,
              ),
        suffixIcon: sufficIcon == null
            ? null
            : Icon(
                sufficIcon,
                color: Colors.black,
              ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFEFEEF1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFEFEEF1)),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFEFEEF1)),
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: const Color(0xFFEFEEF1),
        filled: true,
      ),
    );
  }
}
