import 'package:cyberbracy_mpt_original_front/chat_bot/domain/entity/message.dart';

class MessageDto extends Message {
  const MessageDto(
    super.message,
    super.timestamp,
    super.isBot,
    super.isCanceled,
    super.isButton,
    super.hasTable,
  );

  factory MessageDto.fromJson(Map<String, dynamic> json) {
    return MessageDto(
      json['text'],
      json['timestamp'],
      json['bot'],
      false,
      json['button'],
      json['hasTable'],
    );
  }

  MessageDto copyWith({
    String? message,
    int? timestamp,
    bool? isBot,
    bool? isCanceled,
    bool? isButton,
    bool? hasTable,
  }) =>
      MessageDto(
          message ?? this.message,
          timestamp ?? this.timestamp,
          isBot ?? this.isBot,
          isCanceled ?? this.isCanceled,
          isButton ?? this.isButton,
          hasTable ?? this.hasTable);
}
