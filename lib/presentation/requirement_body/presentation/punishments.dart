import 'package:cyberbracy_mpt_original_front/domain/entity/requirement_body_entity.dart';
import 'package:flutter/material.dart';

import '../../../core/const/colors_theme.dart';

class Punishments extends StatelessWidget {
  final RequirementBodyEntity requirement;

  const Punishments({Key? key, required this.requirement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Ответственность за нарушения',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      requirement.punishType,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Указание на нормативно-правовой акт',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorTheme.grey,
                        ),
                        requirement.punishmentsEntity.right)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Санкции',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            ...requirement.punishmentsEntity.violationsList.map((e) {
              int count = 0;
              return Card(
                borderOnForeground: true,
                shape: Border.all(
                  color: ColorTheme.white,
                  width: 1,
                ),
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ColorTheme.white,
                        border: Border.all(
                          width: 1,
                          color: ColorTheme.lightGrey,
                        ),
                      ),
                      child: Text(e.type),
                    ),
                    ...e.items.map((e) {
                      count++;
                      return Container(
                        decoration: BoxDecoration(
                            border: count % 2 == 0
                                ? Border(
                                    bottom: BorderSide(
                                        color: ColorTheme.background))
                                : null),
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e.header),
                            Text(e.amount),
                          ],
                        ),
                      );
                    })
                  ],
                ),
              );
            }),
            Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 7.5,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.5,
                      horizontal: 10,
                    ),
                    child: Text(
                      'Орган, уполномоченный на привлечение к ответственности',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.5,
                      horizontal: 10,
                    ),
                    child: Text(
                      requirement.organ,
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorTheme.grey,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.5,
                      horizontal: 10,
                    ),
                    child: Text(
                      'Порядок привлечения к ответственности',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.5, horizontal: 10),
                    child: Text(
                      'Привлечение к ответственности осуществляется в порядке, установленном Кодексом Российской Федерации об административных правонарушениях',
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorTheme.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7.5,
                  ),
                  Container(
                    color: ColorTheme.white,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Документ',
                          style: TextStyle(
                            color: ColorTheme.red,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: kBottomNavigationBarHeight + 10,
            )
          ],
        ),
      ),
    );
  }
}
