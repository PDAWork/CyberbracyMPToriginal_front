import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String message;
  final int time;
  final bool isBot;

  const Message(
    this.message,
    this.time,
    this.isBot,
  );
  @override
  List<Object?> get props => [message, isBot];
}
