import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/screen_routes.dart';
import '../../../../../core/const/colors_theme.dart';
import '../../../../../core/const/images_url.dart';
import '../../../../../widget/text_filed_custom.dart';
import '../controller/sign_in_cubit.dart';
import '../controller/sign_in_state.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    emailController.addListener(() {});
    passwordController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInLoadedState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeRoute().routeName,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
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
                  TextFieldCustom(
                    textEditingController: emailController,
                    prefixIcon: Icons.email,
                    title: "Войти в систему",
                    hint: "Email",
                  ),
                  const SizedBox(height: 15),
                  TextFieldCustom(
                    textEditingController: passwordController,
                    suffixIcon: Icons.visibility_off,
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    title: "Регистрация",
                    hint: "Пароль",
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      if (emailController.text.contains('@')) {
                        context.read<SignInCubit>().signInUser(
                            email: emailController.text,
                            password: passwordController.text);
                      }
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
      },
    );
  }
}
