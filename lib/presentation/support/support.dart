import 'package:cyberbracy_mpt_original_front/domain/entity/control_organ_entity.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/requirements_entity.dart';
import 'package:cyberbracy_mpt_original_front/presentation/support/cubit/support_cubit.dart';
import 'package:cyberbracy_mpt_original_front/widget/app_bar_custom.dart';
import 'package:cyberbracy_mpt_original_front/widget/custom_calendar.dart';
import 'package:cyberbracy_mpt_original_front/widget/empty_drop_down_button.dart';
import 'package:cyberbracy_mpt_original_front/widget/organ_drop_down_button.dart';
import 'package:cyberbracy_mpt_original_front/widget/require_drop_down_button.dart';
import 'package:cyberbracy_mpt_original_front/widget/show_message_error.dart';
import 'package:cyberbracy_mpt_original_front/widget/text_filed_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/const/colors_theme.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  ControlOrganEntity? controlOrganEntity;
  RequirementsEntity? requirementsEntity;
  late ValueNotifier<DateTime> selectedTime;
  late TextEditingController controller;

  @override
  void initState() {
    selectedTime = ValueNotifier(DateTime(0));
    controller = TextEditingController();
    super.initState();
  }

  String formatDate(DateTime value) =>
      DateFormat.yMEd('ru_RU').add_jm().format(value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.background,
      appBar: const AppBarCustom(
        isVisibilityChat: true,
        title: 'Записаться на консультирование',
        isChatBot: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Орган контроля'),
              ),
              BlocBuilder<SupportCubit, SupportState>(
                builder: (context, state) {
                  if (state is SupportSeccuse) {
                    context
                        .read<SupportCubit>()
                        .getRequirments(state.controlOrganList.first.lowName);
                    return OrganDropDownButton(
                      choosenEntity: controlOrganEntity,
                      items: state.controlOrganList,
                      onChanged: (value) {
                        controlOrganEntity = value;
                        context
                            .read<SupportCubit>()
                            .getRequirments(value.lowName);
                      },
                    );
                  }
                  if (state is SupportRequirmentsLoaded) {
                    return OrganDropDownButton(
                      items: state.controlOrganList,
                      choosenEntity: controlOrganEntity,
                      onChanged: (value) {
                        controlOrganEntity = value;
                        context
                            .read<SupportCubit>()
                            .getRequirments(value.lowName);
                      },
                    );
                  }
                  return const EmptyDropDownButton();
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Требования'),
              ),
              BlocBuilder<SupportCubit, SupportState>(
                builder: (context, state) {
                  if (state is SupportRequirmentsLoaded) {
                    return RequireDropDownButton(
                      items: state.requirments,
                      onChanged: (value) {
                        requirementsEntity = value;
                      },
                    );
                  }
                  return const EmptyDropDownButton();
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Дата консультирования'),
              ),
              BlocBuilder<SupportCubit, SupportState>(
                builder: (context, state) {
                  if (state is SupportRequirmentsLoaded) {
                    return OutlinedButton(
                      style: Theme.of(context)
                          .outlinedButtonTheme
                          .style
                          ?.copyWith(
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        var size = MediaQuery.of(context).size;
                        Future.delayed(
                          const Duration(microseconds: 1),
                          () => showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              shadowColor: Colors.transparent,
                              surfaceTintColor: Colors.transparent,
                              child: AspectRatio(
                                aspectRatio: size.width / size.height,
                                child: CustomCalendar(
                                  dates: state.dates,
                                  onItemTap: (value) {
                                    Navigator.pop(context);
                                    SnackBarService.showCompleteMessage(
                                        title:
                                            'Выбрана дата: ${formatDate(value)}');
                                    selectedTime.value = value;
                                  },
                                  childAspectRation:
                                      (MediaQuery.of(context).size.width / 2) /
                                          70,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Text('Выберите время консультирования'),
                    );
                  }
                  return const EmptyDropDownButton();
                },
              ),
              ValueListenableBuilder(
                valueListenable: selectedTime,
                builder: (context, value, child) => value.year == 0
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          formatDate(value),
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Вопрос'),
              ),
              TextFieldCustom(
                title: 'Вопрос',
                hint: 'Задайте вопрос',
                fillColor: Colors.white,
                borderColor: Colors.grey.shade500,
                textEditingController: controller,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    Text('Записаться на консультирование'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
