import 'package:cyberbracy_mpt_original_front/domain/entity/npas_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/const/colors_theme.dart';

class Npas extends StatelessWidget {
  final List<NpasEntity> npasList;
  final String fileLink;
  const Npas({Key? key, required this.npasList, required this.fileLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: npasList.length + 1,
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        if (npasList.length == index) {
          return Container(height: kBottomNavigationBarHeight + 10);
        }
        return Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: () => launchUrl(
              Uri.parse(fileLink),
              mode: LaunchMode.externalApplication,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    npasList[index].text,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Период действия',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    npasList[index].date,
                    style: TextStyle(
                      fontSize: 12,
                      color: ColorTheme.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
