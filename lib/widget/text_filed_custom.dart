import 'package:cyberbracy_mpt_original_front/core/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/core/const/input_formaters.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  final IconData? prefixIcon;
  IconData? suffixIcon;
  final bool? isNumber;
  final String title;
  final String hint;
  final bool isPassword;
  final TextEditingController? textEditingController;

  TextFieldCustom({
    super.key,
    this.textEditingController,
    this.prefixIcon,
    this.suffixIcon,
    this.isNumber = false,
    this.isPassword = false,
    required this.title,
    required this.hint,
  });

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? showPassword : false,
      controller: widget.textEditingController,
      inputFormatters: widget.isNumber! ? [maskNumberFormatter] : [],
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: widget.prefixIcon == null
            ? null
            : Icon(
                widget.prefixIcon,
                color: Colors.black,
              ),
        suffixIcon: widget.suffixIcon == null
            ? null
            : GestureDetector(
                onTap: () {
                  if (showPassword) {
                    widget.suffixIcon = Icons.visibility;
                    showPassword = false;
                  } else {
                    widget.suffixIcon = Icons.visibility_off;
                    showPassword = true;
                  }

                  setState(() {});
                },
                child: Icon(
                  widget.suffixIcon,
                  color: Colors.black,
                ),
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
