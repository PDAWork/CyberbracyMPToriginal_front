import 'package:cyberbracy_mpt_original_front/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/widget/num_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class PinVerification extends StatefulWidget {
  const PinVerification({super.key});

  @override
  State<PinVerification> createState() => _PinVerificationState();
}

class _PinVerificationState extends State<PinVerification> {
  final  TextEditingController controller = TextEditingController();

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
            Pinput(
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
  }
}
