import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/screen_routes.dart';
import '../../../../../core/const/images_url.dart';
import '../../../../../widget/text_filed_custom.dart';
import '../controller/sign_up_cubit.dart';
import '../controller/sign_up_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoadedState) {
          Navigator.pushNamed(context, PinVerificationRoute().routeName);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              shrinkWrap: true,
              children: [
                SvgPicture.asset(ImagesUrl.logo),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Открытый контроль',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 15),
                TextFieldCustom(
                  textEditingController: phoneNumberController,
                  prefixIcon: Icons.phone,
                  title: "Войти в систему",
                  hint: "+7 (***) *** ** **",
                ),
                const SizedBox(height: 15),
                TextFieldCustom(
                  textEditingController: emailController,
                  prefixIcon: Icons.email,
                  title: "Войти в систему",
                  hint: "Email",
                ),
                const SizedBox(height: 15),
                TextFieldCustom(
                  textEditingController: nameController,
                  prefixIcon: Icons.man,
                  title: "Войти в систему",
                  hint: "Имя",
                ),
                const SizedBox(height: 15),
                TextFieldCustom(
                  textEditingController: lastNameController,
                  prefixIcon: Icons.man_sharp,
                  title: "Войти в систему",
                  hint: "Фамилия",
                ),
                const SizedBox(height: 15),
                TextFieldCustom(
                  textEditingController: passwordController,
                  suffixIcon: Icons.visibility,
                  prefixIcon: Icons.lock,
                  title: "Регистрация",
                  hint: "Пароль",
                  isPassword: true,
                ),
                const SizedBox(height: 15),
                TextFieldCustom(
                  textEditingController: repeatPassword,
                  suffixIcon: Icons.visibility,
                  prefixIcon: Icons.lock,
                  title: "Регистрация",
                  hint: "Подтверждение пароля",
                  isPassword: true,
                ),
                const SizedBox(height: 25),
                OutlinedButton(
                  onPressed: () {
                    if (passwordController.text == repeatPassword.text) {
                      context.read<SignUpCubit>().signUpUser(
                            email: emailController.text,
                            password: passwordController.text,
                            firstName: nameController.text,
                            lastName: lastNameController.text,
                            phoneNumber: phoneNumberController.text,
                          );
                    }
                  },
                  child: const Text(
                    'Отправить код',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
