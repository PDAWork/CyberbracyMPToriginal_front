import 'package:cyberbracy_mpt_original_front/chat_bot/data/models/message_dto.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/entity/message.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/usecases/send_message.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final SendMessage _sendMessageUseCase;
  ChatCubit(this._sendMessageUseCase) : super(ChatInitial());

  List<Message> messages = [];

  void sendMessage(int userId, String message) async {
    try {
      emit(ChatInitial());
      var myMessage = MessageDto(
          message, DateTime.now().millisecondsSinceEpoch, false, false);
      messages.add(myMessage);
      emit(const ChatLoaded());
      emit(ChatInitial());
      var response =
          await _sendMessageUseCase.call(SendMessageParams(userId, message));
      response.fold(
        (error) {
          emit(ChatError(error.toString()));
          var last = messages.last;
          messages.removeLast();
          last = myMessage.copyWith(isCanceled: true);
          messages.add(last);
        },
        (data) {
          messages.addAll(data);
          emit(const ChatLoaded());
        },
      );
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  void getUserChat() {}
}
