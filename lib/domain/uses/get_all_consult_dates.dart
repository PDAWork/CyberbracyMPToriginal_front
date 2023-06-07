import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/core/usecase.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/controls_date.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/consult_calendar.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetAllConsultDates
    extends UseCase<List<ConsultDates>, GetAllConsultDatesParams> {
  final ConsultCalendarRepository _consultRepository;

  GetAllConsultDates(this._consultRepository);
  @override
  Future<Either<Failure, List<ConsultDates>>> call(
      GetAllConsultDatesParams params) {
    return _consultRepository.getAllConsultDates(params.lowName);
  }
}

class GetAllConsultDatesParams extends Equatable {
  final String lowName;

  const GetAllConsultDatesParams(this.lowName);

  @override
  List<Object?> get props => [lowName];
}
