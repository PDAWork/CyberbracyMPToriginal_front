import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var maskNumberFormatter = MaskTextInputFormatter(
  mask: '+7 (###) ###-##-##',
  filter: {"#": RegExp(r'[0-9A-Za-zа-яА-я]')},
  type: MaskAutoCompletionType.lazy,
);
