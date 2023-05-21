import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widget/text_filed_custom.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              SvgPicture.asset('assets/logo.svg'),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Открытый контрол',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const Spacer(),
              const TextFieldCustom(
                prefixIcon: Icons.phone,
                title: "Войти в систему",
                hint: "+7 (***) *** ** **",
              ),
              const SizedBox(height: 15),
              const TextFieldCustom(
                sufficIcon: Icons.visibility,
                prefixIcon: Icons.lock,
                title: "Регистрация",
                hint: "Пароль",
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Войти в систему'),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Регистрация',
                ),
              ),
              const Spacer(),
              const Center(
                  child: Text(
                'Забыли пароль?',
                style: TextStyle(color: Color(0xFF848484)),
              )),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
