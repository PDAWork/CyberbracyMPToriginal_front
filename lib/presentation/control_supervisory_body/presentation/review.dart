import 'package:cyberbracy_mpt_original_front/domain/entity/control_organ_head_entity.dart';
import 'package:flutter/material.dart';

import '../../../core/const/colors_theme.dart';


class Review extends StatelessWidget {
  final ControlOrganHeadEntity controlOrganHeadEntity;

  const Review({
    required this.controlOrganHeadEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
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
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            controlOrganHeadEntity.urlImage,
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
                                controlOrganHeadEntity.fio,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                controlOrganHeadEntity.post,
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
                      controlOrganHeadEntity.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorTheme.grey,
                      ),
                    ),
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
                    ...controlOrganHeadEntity.commonInfoList.map((e) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.caption,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              e.item,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ]);
                    })
                  ],
                ),
              ),
            ),
            Container(height: kBottomNavigationBarHeight + 10,)
          ],
        ),
      ),
    );
  }
}
