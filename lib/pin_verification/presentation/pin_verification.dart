import 'package:cyberbracy_mpt_original_front/widget/num_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class PinVerification extends StatefulWidget {
  const PinVerification({super.key});

  @override
  State<PinVerification> createState() => _PinVerificationState();
}

class _PinVerificationState extends State<PinVerification> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onNumPressed(String value) {
    if (controller.text.length <= 4) {
      controller.text += value;
    }
  }

  void onClearPressed() {
    if (controller.text.isNotEmpty) {
      controller.text = controller.text.substring(0, controller.length - 1);
    }
  }

  final cursorColor = const Color(0xFFE04142);
  final preFilledColor = const Color(0xFFFFDBDB);

  @override
  Widget build(BuildContext context) {
    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 64,
          height: 1,
          color: cursorColor,
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 64,
          height: 1,
          color: cursorColor,
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
                        color: cursorColor,
                        width: 3,
                      ),
                    ),
                  ),
                ),
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                cursor: cursor,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                preFilledWidget: preFilledWidget,
                autofocus: true,
                keyboardType: TextInputType.none,
                controller: controller,
              ),
              SizedBox(
                width: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberKey(
                          number: '1',
                          onPressed: (value) => onNumPressed(value),
                        ),
                        NumberKey(
                          number: '2',
                          onPressed: (value) => onNumPressed(value),
                        ),
                        NumberKey(
                          number: '3',
                          onPressed: (value) => onNumPressed(value),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberKey(
                          number: '4',
                          onPressed: (value) => onNumPressed(value),
                        ),
                        NumberKey(
                          number: '5',
                          onPressed: (value) => onNumPressed(value),
                        ),
                        NumberKey(
                          number: '6',
                          onPressed: (value) => onNumPressed(value),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberKey(
                          number: '7',
                          onPressed: (value) => onNumPressed(value),
                        ),
                        NumberKey(
                          number: '8',
                          onPressed: (value) => onNumPressed(value),
                        ),
                        NumberKey(
                          number: '9',
                          onPressed: (value) => onNumPressed(value),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 70,
                          height: 70,
                          child: MaterialButton(
                            onPressed: null,
                          ),
                        ),
                        NumberKey(
                          number: '0',
                          onPressed: (value) => onNumPressed(value),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(210, 210, 219, 210),
                            shape: BoxShape.circle,
                          ),
                          child: MaterialButton(
                            onPressed: () => onClearPressed(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                            focusColor: Colors.red,
                            splashColor: Colors.red,
                            child: const Icon(Icons.delete),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
