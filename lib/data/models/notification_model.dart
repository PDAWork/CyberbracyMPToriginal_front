import 'package:cyberbracy_mpt_original_front/domain/entity/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  NotificationModel(super.lowName, super.timestamp);

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(json['lowName'], json['from']);
  }
}

class VideoCallModel extends VideoCallEntiti {
  VideoCallModel(
      {required super.toId, required super.fromId, required super.roomId});
  factory VideoCallModel.fromJson(Map<String, dynamic> json) => VideoCallModel(
        toId: json['toId'],
        fromId: json['fromId'],
        roomId: json['roomId'],
      );
}
