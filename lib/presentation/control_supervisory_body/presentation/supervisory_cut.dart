import 'package:cyberbracy_mpt_original_front/const/screen_routes.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/control_supervisory_organ_entity.dart';
import 'package:flutter/material.dart';

import '../../../const/colors_theme.dart';

class SupervisoryCut extends StatelessWidget {
  const SupervisoryCut({
    super.key,
    required this.items,
    required this.lowName,
  });

  final List<ControlSupervisoryOrganEntity> items;
  final String lowName;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length + 1,
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        if (items.length == index) {
          return Container(height: kBottomNavigationBarHeight + 10);
        }
        return Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: () {
              Navigator.pushNamed(context, RequirementsRoute().routeName,
                  arguments: {
                    'lowName': lowName,
                    'idControl': items[index].idTypeControl
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items[index].name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
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
                        items[index].count.toString(),
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
