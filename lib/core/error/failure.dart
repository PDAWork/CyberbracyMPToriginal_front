import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  String toString() {
    return 'Ошибка сервера';
  }
}

class LocalFailure extends Failure {
  @override
  String toString() {
    return 'Клиентская ошибка';
  }
}
