import 'package:cyberbracy_mpt_original_front/const/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/colors_theme.dart';
import '../../../const/images_url.dart';
import '../../../widget/text_filed_custom.dart';

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
              SvgPicture.asset(ImagesUrl.logo),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Открытый контроль',
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
                suffixIcon: Icons.visibility,
                prefixIcon: Icons.lock,
                title: "Регистрация",
                hint: "Пароль",
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeRoute().routeName);
                },
                child: const Text('Войти в систему'),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignUpRoute().routeName);
                },
                child: const Text(
                  'Регистрация',
                ),
              ),
              const Spacer(),
              Center(
                child: Text(
                  'Забыли пароль?',
                  style: TextStyle(color: ColorTheme.grey),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
