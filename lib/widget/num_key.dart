import 'package:flutter/material.dart';

class NumberKey extends StatelessWidget {
  final String? number;
  final void Function(String value) onPressed;
  final bool background;
  final IconData? icon;

  const NumberKey({
    super.key,
    this.number,
    required this.onPressed,
    this.background = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: background ? const Color.fromRGBO(210, 210, 219, 210) : null,
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: MaterialButton(
        onPressed: () => onPressed(number ?? ""),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusColor: Colors.red,
        splashColor: Colors.red,
        child: number == null
            ? Icon(icon)
            : Text(
                number!,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
