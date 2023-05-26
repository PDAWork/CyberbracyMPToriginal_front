import 'package:cyberbracy_mpt_original_front/const/colors_theme.dart';
import 'package:flutter/material.dart';

class ControlBody extends StatelessWidget {
  const ControlBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 17 + 1,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemBuilder: (context, index) {
              if (index == 17) {
                return const SizedBox(
                  height: kBottomNavigationBarHeight + 15,
                );
              }
              return Card(
                child: InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: () {
                    Navigator.pushNamed(context, 'control_supervisory_body');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ГЛАВНОЕ АРХИВНОЕ УПРАВЛЕНИЕ ГОРОДА МОСКВЫ',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Вид контроля',
                              style: TextStyle(
                                  fontSize: 12, color: ColorTheme.grey),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 12, color: ColorTheme.red),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Обязательные требования',
                              style: TextStyle(
                                  fontSize: 12, color: ColorTheme.grey),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 12, color: ColorTheme.red),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Нормативные акты',
                              style: TextStyle(
                                  fontSize: 12, color: ColorTheme.grey),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 12, color: ColorTheme.red),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
