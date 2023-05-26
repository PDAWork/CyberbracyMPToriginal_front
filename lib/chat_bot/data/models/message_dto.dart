import 'package:cyberbracy_mpt_original_front/chat_bot/domain/entity/message.dart';

class MessageDto extends Message {
  const MessageDto(
    super.message,
    super.time,
    super.isBot,
  );

  factory MessageDto.fromJson(Map<String, dynamic> json) {
    return MessageDto(
        json['message'], DateTime.now().millisecondsSinceEpoch, json['bot']);
  }
}
