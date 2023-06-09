import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  String toString() {
    return 'Ошибка сервера';
  }
}

class LocalFailure extends Failure {
  const LocalFailure(super.message);

  @override
  String toString() {
    return 'Клиентская ошибка';
  }
}
