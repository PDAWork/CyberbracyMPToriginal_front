part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

// class ChatInitial extends ChatState {}

class ChatError extends ChatState {
  final String errorMessage;

  const ChatError(this.errorMessage);
}

class ChatLoaded extends ChatState {
  final List<Message> message;

  const ChatLoaded(this.message);

  @override
  List<Object> get props => [message];
}

// class ChatPaginate extends ChatState {
//   // final List<Message> message;

//   // const ChatPaginate(this.message);
//   // @override
//   // List<Object> get props => [message];
// }
