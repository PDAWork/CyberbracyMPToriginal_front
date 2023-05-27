import 'package:cyberbracy_mpt_original_front/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/const/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/control_body_cubit.dart';

class ControlBody extends StatelessWidget {
  const ControlBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlBodyCubit, ControlBodyState>(
      builder: (context, state) {
        if (state is ControlBodySeccuse) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.list.length + 1,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemBuilder: (context, index) {
                    if (index == state.list.length) {
                      return const SizedBox(
                        height: kBottomNavigationBarHeight + 15,
                      );
                    }
                    return Card(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(4),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ControlSupervisoryRoute().routeName,
                            arguments: {
                              "lowName": state.list[index].lowName,
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.list[index].name,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Вид контроля',
                                    style: TextStyle(
                                        fontSize: 12, color: ColorTheme.grey),
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    state.list[index].typeControl.toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: ColorTheme.red),
                                  )
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Обязательные требования',
                                    style: TextStyle(
                                        fontSize: 12, color: ColorTheme.grey),
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    state.list[index].requirements.toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: ColorTheme.red),
                                  )
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Нормативные акты',
                                    style: TextStyle(
                                        fontSize: 12, color: ColorTheme.grey),
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    state.list[index].npas.toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: ColorTheme.red),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        if (state is ControlBodyLoad) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ControlBodyFailed) {
          Center(
            child: Text(state.errorMesage),
          );
        }
        return const Placeholder();
      },
    );
  }
}
