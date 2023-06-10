import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/consult_date.dart';
import 'package:dartz/dartz.dart';

abstract interface class ConsultCalendarRepository {
  Future<Either<Failure, List<ConsultDates>>> getConsultDates(int id);

  Future<Either<Failure, List<ConsultDates>>> getAllConsultDates(
      String lowName);

  Future<Either<Failure, String>> signUpOnConsult(int userId, String lowName,
      int idControl, int idRequire, int timestamp, String question);

  Future<Either<Failure, String>> confirmConsult(
      int userId, int timestamp, String lowName);
}
