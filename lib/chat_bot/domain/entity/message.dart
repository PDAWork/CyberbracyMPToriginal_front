import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String message;
  final int timestamp;
  final bool isBot;
  final bool isCanceled;
  final bool isButton;
  final bool hasTable;

  const Message(
    this.message,
    this.timestamp,
    this.isBot,
    this.isCanceled,
    this.isButton,
    this.hasTable,
  );
  @override
  List<Object?> get props =>
      [message, timestamp, isBot, isCanceled, isButton, hasTable];
}
