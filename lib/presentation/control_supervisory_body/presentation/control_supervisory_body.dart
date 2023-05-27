import 'package:cyberbracy_mpt_original_front/presentation/control_supervisory_body/presentation/regulatory_acts.dart';
import 'package:cyberbracy_mpt_original_front/presentation/control_supervisory_body/presentation/review.dart';
import 'package:cyberbracy_mpt_original_front/presentation/control_supervisory_body/presentation/supervisory_cut.dart';
import 'package:cyberbracy_mpt_original_front/presentation/control_supervisory_body/state/control_supervisory_body_cubit.dart';
import 'package:cyberbracy_mpt_original_front/widget/app_bar_custom.dart';
import 'package:cyberbracy_mpt_original_front/widget/floating_action_button_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/colors_theme.dart';

class ControlSupervisoryBody extends StatefulWidget {
  const ControlSupervisoryBody({Key? key, required this.lowName})
      : super(key: key);
  final String lowName;

  @override
  State<ControlSupervisoryBody> createState() => _ControlSupervisoryBodyState();
}

class _ControlSupervisoryBodyState extends State<ControlSupervisoryBody> {
  @override
  void initState() {
    context.read<ControlSupervisoryBodyCubit>().init(widget.lowName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: const FloatinActionButtonSupport(),
        backgroundColor: ColorTheme.white,
        appBar: AppBarCustom(
          title: "Орган контроля",
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
                text: "Контроль-надзорный орган",
              ),
              Tab(
                text: "Нормативные акты",
              ),
            ],
          ),
        ),
        body: BlocBuilder<ControlSupervisoryBodyCubit,
            ControlSupervisoryBodyState>(
          builder: (context, state) {
            if (state is ControlSupervisoryBodyFailed) {
              return const Text('Ошибка');
            }
            if (state is ControlSupervisoryBodySeccuse) {
              return TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Review(controlOrganHeadEntity: state.controlOrganHeadEntity),
                  SupervisoryCut(
                    items: state.controlSupervisoryOrganEntity,
                    lowName: widget.lowName,
                  ),
                  RegulatoryActs(npasEntity:  state.npasEntity),
                ],
              );
            }
            if (state is ControlSupervisoryBodyLoad) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Placeholder();
          },
        ),
      ),
    );
  }
}
