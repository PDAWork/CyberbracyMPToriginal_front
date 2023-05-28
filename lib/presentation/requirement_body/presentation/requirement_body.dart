import 'package:cyberbracy_mpt_original_front/presentation/requirement_body/presentation/npas.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement_body/presentation/punishments.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement_body/presentation/review.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement_body/state/requirement_body_cubit.dart';
import 'package:cyberbracy_mpt_original_front/widget/app_bar_custom.dart';
import 'package:cyberbracy_mpt_original_front/widget/floating_action_button_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/const/colors_theme.dart';

class RequirementBody extends StatelessWidget {
  const RequirementBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: const FloatinActionButtonSupport(),
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
        body: BlocBuilder<RequirementBodyCubit, RequirementBodyState>(
          builder: (context, state) {
            if (state is RequirementBodySeccuse) {
              return TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Review(requirement: state.requirement),
                  Punishments(requirement: state.requirement),
                  Npas(
                      npasList: state.requirement.npasList,
                      fileLink: state.requirement.fileLink),
                ],
              );
            }
            if (state is RequirementBodyLoad) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is RequirementBodyFailed) {
              return const Center(
                child: Text('ошибка'),
              );
            }
            return const Placeholder();
          },
        ),
      ),
    );
  }
}
