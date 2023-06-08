import 'package:cyberbracy_mpt_original_front/core/const/colors_theme.dart';
import 'package:flutter/material.dart';

class ChatDownButton extends StatefulWidget {
  final ValueNotifier<bool> value;
  final VoidCallback onTap;
  const ChatDownButton({
    super.key,
    required this.value,
    required this.onTap,
  });

  @override
  State<ChatDownButton> createState() => _DownButtonState();
}

class _DownButtonState extends State<ChatDownButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ValueListenableBuilder(
          valueListenable: widget.value,
          builder: (context, value, child) {
            if (value) {
              animationController.forward();
              return FadeTransition(
                opacity: animationController,
                child: FloatingActionButton(
                  backgroundColor: ColorTheme.darkRed,
                  onPressed: widget.onTap,
                  child: const Icon(
                    Icons.arrow_downward,
                  ),
                ),
              );
            } else {
              animationController.reverse();
              return FadeTransition(
                opacity: animationController,
                child: FloatingActionButton(
                  backgroundColor: ColorTheme.darkRed,
                  onPressed: widget.onTap,
                  child: const Icon(
                    Icons.arrow_downward,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
