import 'package:flutter/material.dart';

import '../../../const/colors_theme.dart';

class RegulatoryActs extends StatelessWidget {
  const RegulatoryActs({
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
                    'Приказ Федерального органа государственной власти от 31.03.2015 №526 "Об утверждении правил организации хранения, комплектования, учета и использования документов Архивного фонда Российской Федерации и других архивных документов в органах государственной власти, органах местного самоуправления и организациях (Зарегистрировано в Минюсте России 07.09.2015 N 38830)',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '07.04.2021',
                        style: TextStyle(
                            fontSize: 12, color: ColorTheme.grey),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '480 KB PDF',
                        style: TextStyle(
                            fontSize: 12, color: ColorTheme.grey),
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
