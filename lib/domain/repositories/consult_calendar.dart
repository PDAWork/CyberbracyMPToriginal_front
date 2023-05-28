import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/controls_date.dart';
import 'package:dartz/dartz.dart';

abstract interface class ConsultCalendarRepository {
  Future<Either<Failure, List<ConsultDates>>> getConsultDates(int id);
}
