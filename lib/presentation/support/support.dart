import 'package:cyberbracy_mpt_original_front/core/const/types.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/control_organ_entity.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/requirements_entity.dart';
import 'package:cyberbracy_mpt_original_front/presentation/support/cubit/support_cubit.dart';
import 'package:cyberbracy_mpt_original_front/service_locator.dart';
import 'package:cyberbracy_mpt_original_front/widget/app_bar_custom.dart';
import 'package:cyberbracy_mpt_original_front/widget/custom_calendar.dart';
import 'package:cyberbracy_mpt_original_front/widget/empty_drop_down_button.dart';
import 'package:cyberbracy_mpt_original_front/widget/organ_drop_down_button.dart';
import 'package:cyberbracy_mpt_original_front/widget/require_drop_down_button.dart';
import 'package:cyberbracy_mpt_original_front/core/snack_bar_service.dart';
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
              BlocConsumer<SupportCubit, SupportState>(
                listener: (context, state) {
                  if (state is SupportEntryAdded) {
                    SnackBarService.showCompleteMessage(title: state.message);
                  }
                  if (state is SupportFailed) {
                    SnackBarService.showErrorMessage(title: state.message);
                  }
                },
                builder: (context, state) {
                  if (state is SupportSeccuse) {
                    context
                        .read<SupportCubit>()
                        .getRequirments(state.controlOrganList.first.lowName);
                    controlOrganEntity = state.controlOrganList.first;
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
                    requirementsEntity = state.requirments.first;
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
                    var list = state.dates.toList();
                    for (var i = 0; i < state.dates.length; i++) {
                      for (var j = 0;
                          j < state.dates[i].consultDateList.length;
                          j++) {
                        var element = list[i];
                        if (element.consultDate.day == DateTime.now().day) {
                          element.consultDateList.removeWhere(
                            (element) =>
                                element.dateTime.hour < DateTime.now().hour,
                          );
                        }
                        element.consultDateList.removeWhere(
                          (element) => element.busy == true,
                        );
                      }
                    }
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
                                  dates: list,
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
                isDense: true,
                fillColor: Colors.white,
                maxLines: null,
                borderColor: Colors.grey.shade500,
                textEditingController: controller,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  if (controlOrganEntity != null &&
                      requirementsEntity != null &&
                      controller.text.isNotEmpty &&
                      selectedTime.value.year != 0) {
                    context.read<SupportCubit>().signUpOnConsult(
                          sl.get<UserId>(),
                          controlOrganEntity!.lowName,
                          requirementsEntity!.idControl,
                          requirementsEntity!.idRequire,
                          selectedTime.value.millisecondsSinceEpoch,
                          controller.text,
                        );
                  } else {
                    SnackBarService.showErrorMessage(title: 'Заполните поля!');
                  }
                },
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
