import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/core/usecase.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/controls_date.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/consult_calendar.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetConsultDates
    extends UseCase<List<ConsultDates>, GetConsultDatesParams> {
  final ConsultCalendarRepository _consultRepository;

  GetConsultDates(this._consultRepository);
  @override
  Future<Either<Failure, List<ConsultDates>>> call(
      GetConsultDatesParams params) {
    return _consultRepository.getConsultDates(params.id);
  }
}

class GetConsultDatesParams extends Equatable {
  final int id;

  const GetConsultDatesParams(this.id);

  @override
  List<Object?> get props => [id];
}
