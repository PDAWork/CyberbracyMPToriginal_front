import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  final VoidCallback onTap;
  const SendButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white.withOpacity(.2),
        customBorder: const CircleBorder(),
        onTap: onTap,
      ),
    );
  }
}
