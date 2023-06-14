class NotificationEntity {
  final String lowName;
  final int timestamp;

  NotificationEntity(this.lowName, this.timestamp);
}


class VideoCallEntiti{
  final int toId;
  final int fromId;
  final String roomId;

  VideoCallEntiti({required this.toId, required this.fromId, required this.roomId});

}