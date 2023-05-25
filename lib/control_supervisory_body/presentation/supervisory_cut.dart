import 'package:flutter/material.dart';

import '../../const/colors_theme.dart';

class SupervisoryCut extends StatelessWidget {
  const SupervisoryCut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 15 + 1,
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        if (15 == index) {
          return Container(height: kBottomNavigationBarHeight + 10);
        }
        return Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Региональный государственный контроль (надзор) за соблюдением законодательства Российской Федерации и города Москвы об архивном деле в городе Москве',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Обязательные требования',
                        style: TextStyle(fontSize: 12, color: ColorTheme.grey),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '38',
                        style: TextStyle(fontSize: 12, color: ColorTheme.red),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
