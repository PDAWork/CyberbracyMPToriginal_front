import 'package:cyberbracy_mpt_original_front/const/colors_theme.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String title;
  final String hint;

  const TextFieldCustom({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
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
        suffixIcon: suffixIcon == null
            ? null
            : Icon(
                suffixIcon,
                color: Colors.black,
              ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: ColorTheme.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: ColorTheme.white),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorTheme.white),
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: ColorTheme.white,
        filled: true,
      ),
    );
  }
}
