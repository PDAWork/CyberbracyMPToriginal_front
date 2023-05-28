import 'package:flutter/material.dart';

import '../../../const/colors_theme.dart';

class Npas extends StatelessWidget {
  const Npas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10 + 1,
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        if (10 == index) {
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
                    'п. 2.27 Приложения к Приказу Министерства культуры Российской Федерации от 31.03.2015 № 526 "Об утверждении правил организации хранения, комплектования, учета и использования документов архивного фонда Российской Федерации и других архивных документов в органах госудасртенной власти, органах местного самоуправления": "Помещения архива организации должны содержаться в чистоте, в условиях, исключающих возможность появления плесени, грызунов, насекомых, пыли. В помещениях архивохранилищ должна быть обеспечена свободная циркуляция воздуха, исключающая образование непроветриваемых зон, опасных в санитарно-биологическом отношении. В помещениях архивохранилищ необходимо: проводить систематическую влажную уборку; не реже одного раза в год проводить обеспыливание коробок с документами, шкафов, стеллажей; обрабатывать цокольные части стеллажей, полы, плинтусы, подоконники водными растворами антисептиков".',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Период действия',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    'с 31.03.2015 по н.в.',
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
