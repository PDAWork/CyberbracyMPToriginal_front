import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/message_dto.dart';
import '../../../../domain/entity/message.dart';
import '../../../../domain/uses/get_max_pages.dart';
import '../../../../domain/uses/get_messages.dart';
import '../../../../domain/uses/send_message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final SendMessage _sendMessageUseCase;
  final GetMessages _getMessageUseCase;
  final GetMaxPages _getMaxPages;
  ChatCubit(
      this._sendMessageUseCase, this._getMessageUseCase, this._getMaxPages)
      : super(ChatInitial());

  List<Message> messages = [];
  int maxPages = 0;

  void sendMessage(int userId, String message) async {
    try {
      emit(ChatInitial());
      var myMessage = MessageDto(
        message,
        DateTime.now().millisecondsSinceEpoch,
        false,
        false,
        false,
        false,
      );
      messages.insert(0,myMessage);
      emit(ChatLoaded());
      emit(ChatInitial());
      var response =
          await _sendMessageUseCase.call(SendMessageParams(userId, message));
      response.fold(
        (error) {
          emit(ChatError(error.toString()));
          var last = messages.last;
          messages.removeAt(0);
          last = myMessage.copyWith(isCanceled: true);
          messages.insert(0,last);
        },
        (data) {
          messages.insert(0,data);
          emit(ChatLoaded());
        },
      );
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> getUserChat(int id, int page) async {
    try {
      emit(ChatInitial());
      var response = await _getMessageUseCase.call(GetMessagesParams(id, page));
      response.fold(
        (error) {
          emit(ChatError(error.toString()));
        },
        (data) {
          messages.addAll(data.reversed);
          emit(ChatPaginate());
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
