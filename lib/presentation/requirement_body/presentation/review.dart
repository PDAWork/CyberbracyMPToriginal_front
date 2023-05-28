import 'package:cyberbracy_mpt_original_front/core/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/requirement_body_entity.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  final RequirementBodyEntity requirement;

  const Review({Key? key, required this.requirement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    requirement.requireName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Контрольно-надзорный орган',
                    style: TextStyle(fontSize: 14, color: ColorTheme.grey),
                  ),
                  Text(
                    requirement.knoTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Вид контроля',
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorTheme.grey,
                    ),
                  ),
                  Text(
                    requirement.typeControl,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Виды деятельности',
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorTheme.grey,
                    ),
                  ),
                  Text(
                    requirement.typeOfDeyatelnostSubjectControl,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
