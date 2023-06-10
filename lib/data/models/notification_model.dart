import 'package:cyberbracy_mpt_original_front/domain/entity/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  NotificationModel(super.lowName, super.timestamp);

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(json['lowName'], json['from']);
  }
}
