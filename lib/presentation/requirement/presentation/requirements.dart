import 'package:cyberbracy_mpt_original_front/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/const/screen_routes.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement/state/requirements_cubit.dart';
import 'package:cyberbracy_mpt_original_front/widget/app_bar_custom.dart';
import 'package:cyberbracy_mpt_original_front/widget/floating_action_button_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Requirements extends StatelessWidget {
  const Requirements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.white,
      appBar: const AppBarCustom(
        title: 'Требования',
      ),
      floatingActionButton: const FloatinActionButtonSupport(),
      body: BlocBuilder<RequirementsCubit, RequirementsState>(
        builder: (context, state) {
          if (state is RequirementsLoad) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RequirementsSeccuse) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              itemCount: state.requirements.length,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(4),
                    onTap: () {
                      Navigator.pushNamed(
                          context, RequirementsBodyRoute().routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            state.requirements[index].name,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text('Вид контроля'),
                          Text(
                            state.requirements[index].typeControl,
                            style:
                                TextStyle(fontSize: 12, color: ColorTheme.grey),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text('Код деятельности'),
                          ),
                          SizedBox(
                            height: 25,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  state.requirements[index].activities.length,
                              itemBuilder: (context, i) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      color: ColorTheme.lightRed,
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 7,
                                  ),
                                  child: Text(
                                    state
                                        .requirements[index].activities[i].code,
                                    style: TextStyle(
                                        fontSize: 12, color: ColorTheme.grey),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text('Вид деятельнсти'),
                          Text(
                            state.requirements[index].responsibility,
                            style: TextStyle(
                              fontSize: 12,
                              color: ColorTheme.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Placeholder();
        },
      ),
    );
  }
}
