import 'package:cyberbracy_mpt_original_front/const/colors_theme.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required TextEditingController controller,
  }) : _textEditingController = controller;
  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);

    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      height: query.size.height * 0.06,
      child: TextField(
        controller: _textEditingController,
        cursorColor: ColorTheme.red,
        textAlignVertical: TextAlignVertical.center,
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(
          hintText: "Текст...",
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
