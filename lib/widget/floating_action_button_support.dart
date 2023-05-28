import 'package:cyberbracy_mpt_original_front/core/screen_routes.dart';
import 'package:flutter/material.dart';

class FloatinActionButtonSupport extends StatelessWidget {
  const FloatinActionButtonSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, SupportRoute().routeName);
        },
        child: const Row(
          children: [Icon(Icons.add), Text('Задать вопрос')],
        ),
      ),
    );
  }
}
