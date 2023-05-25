import 'package:cyberbracy_mpt_original_front/control_supervisory_body/presentation/review.dart';
import 'package:cyberbracy_mpt_original_front/widget/app_bar_custom.dart';
import 'package:flutter/material.dart';

import '../../const/colors_theme.dart';

class ControlSupervisoryBody extends StatefulWidget {
 const  ControlSupervisoryBody({Key? key}) : super(key: key);

  @override
  State<ControlSupervisoryBody> createState() => _ControlSupervisoryBodyState();
}

class _ControlSupervisoryBodyState extends State<ControlSupervisoryBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: SizedBox(
          width: 155,
          child: ElevatedButton(
            onPressed: () {},
            child: const Row(
              children: [Icon(Icons.add), Text('Задать вопрос')],
            ),
          ),
        ),
        backgroundColor: ColorTheme.white,
        appBar: AppBarCustom(
          title: "Орган контроля",
          bottom: TabBar(
            labelColor: Colors.black,
            isScrollable: true,
            labelStyle:const TextStyle(
              fontSize: 12,
            ),
            indicatorColor: ColorTheme.red,
            tabs:const [
              Tab(
                text: "Обзор",
              ),
              Tab(
                text: "Контроль-надзорный орган",
              ),
              Tab(
                text: "Нормативные акты",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            Review(),
            Text('2'),
            Text('3'),
          ],
        ),
      ),
    );
  }
}
