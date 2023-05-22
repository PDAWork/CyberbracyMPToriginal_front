import 'package:flutter/material.dart';

class NumberKey extends StatelessWidget {
  final String number;
  final void Function(String value) onPressed;
  const NumberKey({super.key, required this.number, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(210, 210, 219, 210),
        shape: BoxShape.circle,
      ),
      child: MaterialButton(
        onPressed: () => onPressed(number),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        focusColor: Colors.red,
        splashColor: Colors.red,
        child: Text(
          number,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
