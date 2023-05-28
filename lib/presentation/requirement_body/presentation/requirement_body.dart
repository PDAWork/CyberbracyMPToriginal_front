import 'package:cyberbracy_mpt_original_front/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement_body/presentation/npas.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement_body/presentation/punishments.dart';
import 'package:cyberbracy_mpt_original_front/widget/app_bar_custom.dart';
import 'package:flutter/material.dart';

class RequirementBody extends StatelessWidget {
  const RequirementBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorTheme.background,
        appBar: AppBarCustom(
          title: 'Описание требования',
          bottom: TabBar(
            labelColor: Colors.black,
            isScrollable: true,
            labelStyle: const TextStyle(
              fontSize: 12,
            ),
            indicatorColor: ColorTheme.red,
            tabs: const [
              Tab(
                text: "Обзор",
              ),
              Tab(
                text: "Ответственность",
              ),
              Tab(
                text: "Нормативные правовые акты",
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(''),
            Punishments(),
            Npas(),
          ],
        ),
      ),
    );
  }
}
