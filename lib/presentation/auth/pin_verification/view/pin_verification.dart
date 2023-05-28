import 'package:cyberbracy_mpt_original_front/core/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/core/screen_routes.dart';
import 'package:cyberbracy_mpt_original_front/widget/num_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../sign_up/controller/sign_up_cubit.dart';
import '../../sign_up/controller/sign_up_state.dart';
import '../controller/pin_cubit.dart';
import '../controller/pin_state.dart';

class PinVerification extends StatefulWidget {
  const PinVerification({super.key});

  @override
  State<PinVerification> createState() => _PinVerificationState();
}

class _PinVerificationState extends State<PinVerification> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onNumPressed(String value) {
    if (controller.text.length < 4) {
      controller.text += value;
    }
  }

  void onClearPressed() {
    if (controller.text.isNotEmpty) {
      controller.clear();
    }
  }

  void onDeletePressed() {
    if (controller.text.isNotEmpty) {
      controller.text = controller.text.substring(0, controller.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PinCubit, PinState>(
      listener: (context, state) {
        if (state is PinLoadedState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeRoute().routeName,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: ColorTheme.red,
          ),
          body: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text("Код подтверждения",
                    style: Theme.of(context).textTheme.titleLarge),
                const Spacer(),
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return Pinput(
                      onChanged: (value) {
                        if (state is SignUpLoadedState) {
                          if (value == state.signUpEntity.code) {
                            context.read<PinCubit>().userVerification(
                                code: value, id: state.signUpEntity.id);
                          }
                        }
                      },
                      pinAnimationType: PinAnimationType.fade,
                      defaultPinTheme: PinTheme(
                        width: 64,
                        height: 64,
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.black),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ColorTheme.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      cursor: Container(),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      preFilledWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 65,
                            height: 1,
                            color: ColorTheme.red,
                          ),
                        ],
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.none,
                      controller: controller,
                    );
                  },
                ),
                const Spacer(flex: 2),
                NumKeyboard(
                  onNumPressed: onNumPressed,
                  onClearPressed: onClearPressed,
                  onDeletePressed: onDeletePressed,
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
        );
      },
    );
  }
}
