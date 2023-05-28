import 'package:flutter/material.dart';

class FloatinActionButtonSupport extends StatelessWidget {
  const FloatinActionButtonSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      child: ElevatedButton(
        onPressed: () {},
        child: const Row(
          children: [Icon(Icons.add), Text('Задать вопрос')],
        ),
      ),
    );
  }
}
