import 'package:cyberbracy_mpt_original_front/widget/text_filed_custom.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: const [
            HeadlineLargeWidget(
              text: 'Профиль',
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Мы загрузили данные из государственной системы, но вы можете изменить некоторую контактную информацию, если это необходимо',
            ),
            SizedBox(
              height: 16,
            ),
            ContactDataWidget(),
            SizedBox(
              height: 16,
            ),
            MainDataWidget(),
            SizedBox(
              height: 16,
            ),
            PassportDataWidget(),
          ],
        ),
      ),
    );
  }
}

class ContactDataWidget extends StatelessWidget {
  const ContactDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadlineMediumWidget(text: 'Контактные данные'),
        const SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          hint: 'Номер телефона',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          hint: 'Электронная почта',
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}

class MainDataWidget extends StatelessWidget {
  const MainDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadlineMediumWidget(text: 'Основные данные'),
        const SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          hint: 'Фамииля',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          hint: 'Имя',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          hint: 'Отчество',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          hint: 'ИНН',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          hint: 'СНИЛС',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          hint: 'Пол',
        ),
        const SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          hint: 'Дата рождения',
          keyboardType: TextInputType.datetime,
        )
      ],
    );
  }
}

class PassportDataWidget extends StatelessWidget {
  const PassportDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadlineMediumWidget(text: 'Паспортные данные'),
        const SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          hint: 'Серия',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          hint: 'Номер',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          hint: 'Дата выдачи',
        ),
        const SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          hint: 'Кем выдан',
        ),
        const SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          hint: 'Адрес регистрации',
          keyboardType: TextInputType.streetAddress,
        ),
      ],
    );
  }
}

class HeadlineLargeWidget extends StatelessWidget {
  final String text;
  const HeadlineLargeWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Colors.black,
          ),
    );
  }
}

class HeadlineMediumWidget extends StatelessWidget {
  final String text;
  const HeadlineMediumWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.black,
          ),
    );
  }
}
