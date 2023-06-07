import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/core/usecase.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/consult_calendar.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SignUpOnConsult extends UseCase<String, SignUpOnParams> {
  final ConsultCalendarRepository _consultRepository;

  SignUpOnConsult(this._consultRepository);

  @override
  Future<Either<Failure, String>> call(SignUpOnParams params) {
    return _consultRepository.signUpOnConsult(
      params.userId,
      params.lowName,
      params.idControl,
      params.idRequire,
      params.from,
      params.question,
    );
  }
}

class SignUpOnParams extends Equatable {
  final int userId;
  final String lowName;
  final int idControl;
  final int idRequire;
  final int from;
  final String question;

  const SignUpOnParams(this.lowName, this.userId, this.idControl,
      this.idRequire, this.from, this.question);

  @override
  List<Object?> get props =>
      [userId, lowName, idControl, idRequire, from, question];
}
