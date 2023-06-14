import 'dart:convert';
import 'dart:io';

import 'package:cyberbracy_mpt_original_front/core/const/types.dart';
import 'package:cyberbracy_mpt_original_front/data/models/notification_model.dart';
import 'package:cyberbracy_mpt_original_front/domain/uses/confirm_consult.dart';
import 'package:cyberbracy_mpt_original_front/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

part 'one_signal_wrapper_state.dart';

class OneSignalWrapperCubit extends Cubit<OneSignalWrapperState> {
  final ConfirmConsult _confirmConsult;
  OneSignalWrapperCubit(this._confirmConsult)
      : super(OneSignalWrapperInitial());

  Future<void> handleClickNotification(
      OSNotificationOpenedResult notification) async {
    if (notification.notification.buttons?.isNotEmpty == true) {
      var button = notification.notification.buttons;
      if (button?.first.text == "Подтвердить") {
        var data = NotificationModel.fromJson(
          jsonDecode(button!.first.id),
        );
        if (sl.isRegistered<UserId>()) {
          await _confirmConsult.call(
            ConfirmConsultParams(data.lowName, sl<UserId>(), data.timestamp),
          );
        }
      }else if (button?.first.text == "Присоединиться") {
        var data = VideoCallModel.fromJson(
          jsonDecode(button!.first.id),
        );
        if (Platform.isIOS) {
          emit(OneSignalWrapperIos(
            data.roomId,
            data.toId,
            data.fromId,
          ));
        }else{
          emit(OneSignalWrapperAndoid(
             data.roomId,
            data.toId,
            data.fromId,
          ));
        }
      }
    }
  }
}
