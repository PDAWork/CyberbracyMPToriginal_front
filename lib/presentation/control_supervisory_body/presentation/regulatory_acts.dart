import 'package:cyberbracy_mpt_original_front/domain/entity/npas_entity.dart';
import 'package:flutter/material.dart';

import '../../../const/colors_theme.dart';

class RegulatoryActs extends StatelessWidget {
  final List<NpasEntity> npasEntity;

  const RegulatoryActs({
    super.key,
    required this.npasEntity,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: npasEntity.length + 1,
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        if (npasEntity.length == index) {
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
                  Text(
                    npasEntity[index].text,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        npasEntity[index].date,
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorTheme.grey,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        npasEntity[index].fileInfo,
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorTheme.grey,
                        ),
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
