import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/core/usecase.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/consult_calendar.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ConfirmConsult extends UseCase<String, ConfirmConsultParams> {
  final ConsultCalendarRepository _consultRepository;

  ConfirmConsult(this._consultRepository);
  @override
  Future<Either<Failure, String>> call(ConfirmConsultParams params) {
    return _consultRepository.confirmConsult(
        params.userId, params.timestamp, params.lowName);
  }
}

class ConfirmConsultParams extends Equatable {
  final int userId;
  final String lowName;
  final int timestamp;

  const ConfirmConsultParams(this.lowName, this.userId, this.timestamp);

  @override
  List<Object?> get props => [lowName];
}
