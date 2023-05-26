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
      messages.add(
          MessageDto(message, DateTime.now().millisecondsSinceEpoch, false));
      emit(const ChatLoaded());
      var response =
          await _sendMessageUseCase.call(SendMessageParams(userId, message));
      emit(ChatInitial());
      response.fold(
        (error) => emit(
          ChatError(error.toString()),
        ),
        (data) {
          messages.addAll(data);
          emit(const ChatLoaded());
        },
      );
    } catch (e) {
      ChatError(e.toString());
    }
  }
}
