import 'package:cyberbracy_mpt_original_front/chat_bot/data/models/message_dto.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/entity/message.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/usecases/get_max_pages.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/usecases/get_messages.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/usecases/send_message.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final SendMessage _sendMessageUseCase;
  final GetMessages _getMessageUseCase;
  final GetMaxPages _getMaxPages;
  ChatCubit(
      this._sendMessageUseCase, this._getMessageUseCase, this._getMaxPages)
      : super(const ChatLoaded([]));

  final List<Message> _messages = [];
  int maxPages = 0;

  void sendMessage(int userId, String message) async {
    try {
      var myMessage = MessageDto(
          message, DateTime.now().millisecondsSinceEpoch, false, false);
      _messages.add(myMessage);
      emit(ChatLoaded(_messages));
      var response =
          await _sendMessageUseCase.call(SendMessageParams(userId, message));
      response.fold(
        (error) {
          emit(ChatError(error.toString()));
          var last = _messages.last;
          _messages.removeLast();
          last = myMessage.copyWith(isCanceled: true);
          _messages.add(last);
        },
        (data) {
          _messages.add(data);
          emit(ChatLoaded(_messages));
        },
      );
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> getUserChat(int id, int page) async {
    try {
      var response = await _getMessageUseCase.call(GetMessagesParams(id, page));
      response.fold(
        (error) {
          emit(ChatError(error.toString()));
        },
        (data) {
          _messages.insertAll(0, data);
          emit(ChatLoaded(_messages));
        },
      );
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> getMaxPages(int id) async {
    try {
      var response = await _getMaxPages.call(GetMaxPagesParams(id));
      response.fold(
        (error) => emit(ChatError(error.toString())),
        (data) => maxPages = data,
      );
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
