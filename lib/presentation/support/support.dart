import 'package:cyberbracy_mpt_original_front/domain/entity/control_organ_entity.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/control_organ_head_entity.dart';
import 'package:cyberbracy_mpt_original_front/presentation/support/cubit/support_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/support/cubit/support_cubit.dart';
import 'package:cyberbracy_mpt_original_front/widget/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/const/colors_theme.dart';

class Support extends StatefulWidget {
  Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  ControlOrganEntity controlOrganEntity = ControlOrganEntity.empty();

  ControlOrganHeadEntity controlOrganEntity2 = ControlOrganHeadEntity.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        isVisibilityChat: true,
        title: 'Записаться на консультирование',
        isChatBot: true,
      ),
      body: BlocBuilder<SupportCubit, SupportState>(
        builder: (context, state) {
          if (state is SupportSeccuse) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Орган контроля'),
                  SizedBox(
                    height: 5,
                  ),
                  DropdownButtonFormField<ControlOrganEntity>(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: ColorTheme.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: ColorTheme.white),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorTheme.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        fillColor: ColorTheme.white,
                        filled: true,
                      ),
                      value: state.controlOrganList.first,
                      onChanged: (ControlOrganEntity? newValue) {
                        setState(() {
                          controlOrganEntity = newValue!;
                        });
                      },
                      items: [
                        ...state.controlOrganList.map((e) => DropdownMenuItem(
                              child: Container(
                                width: 300,
                                child: Text(
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  e.lowName,
                                ),
                              ),
                              value: e,
                            ))
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Контрольно-надзорный орган'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Требования'),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Text('Дата консультрования'),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Text('Время консультирования'),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Text('Вопрос'),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text('Записаться на консультирование'),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
