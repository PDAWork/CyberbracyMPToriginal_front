import 'package:flutter/material.dart';

import '../../../const/colors_theme.dart';

class Review extends StatelessWidget {
  const Review({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://knd.mos.ru/api/files/c612f37d-85a8-4663-bc99-55e9f2c3664d',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Онопенко Ярослав Аксентьевич',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Начальник Главного архивного управления города Москвы',
                              maxLines: 2,
                              style: TextStyle(
                                color: ColorTheme.grey,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      'Описание',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                      'Главное архивное управление города Москвы (Главархив) реализует государственную политику в сфере архивного дела, а также охраны и использования историко-документального наследия.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorTheme.grey,
                      )),
                  const SizedBox(
                    height: 7,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(3),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Подробнее',
                        style: TextStyle(
                          color: ColorTheme.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Адрес',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Россия, Москва, Профсоюзная улица, 80к2',
                  ),
                  const Text(
                    'График работы',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ...List.generate(
                    7,
                    (index) => Text('Понедельник 09:00 – 16:00'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
