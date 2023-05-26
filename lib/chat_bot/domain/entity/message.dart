import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String message;
  final int timestamp;
  final bool isBot;
  final bool isCanceled;

  const Message(
    this.message,
    this.timestamp,
    this.isBot,
    this.isCanceled,
  );
  @override
  List<Object?> get props => [message, isBot];
}
