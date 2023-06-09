import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/data/datasource/consult_calendar_remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/consult_date.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/consult_calendar.dart';
import 'package:dartz/dartz.dart';

class ConsultCalendarRepositoryImpl implements ConsultCalendarRepository {
  final ConsultCalendarRemoteDataSource calendarRemoteDataSource;

  ConsultCalendarRepositoryImpl(this.calendarRemoteDataSource);

  @override
  Future<Either<Failure, List<ConsultDates>>> getConsultDates(int id) async {
    return await _getConsultDates(
        () => calendarRemoteDataSource.getConsultDates(id));
  }

  Future<Either<Failure, List<ConsultDates>>> _getConsultDates(
      Future<List<ConsultDates>> Function() date) async {
    try {
      final model = await date();
      return Right(model);
    } catch (e) {
      return Left(ServerFailure(e is Failure ? e.message : e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ConsultDates>>> getAllConsultDates(
      String lowName) async {
    return await _getAllConsultDates(
        () => calendarRemoteDataSource.getAllConsultDates(lowName));
  }

  Future<Either<Failure, List<ConsultDates>>> _getAllConsultDates(
      Future<List<ConsultDates>> Function() date) async {
    try {
      final model = await date();
      return Right(model);
    } catch (e) {
      return Left(ServerFailure(e is Failure ? e.message : e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signUpOnConsult(int userId, String lowName,
      int idControl, int idRequire, int timestamp, String question) async {
    return await _signUpOnConsult(() =>
        calendarRemoteDataSource.signUpOnConsult(
            userId, lowName, idControl, idRequire, timestamp, question));
  }

  Future<Either<Failure, String>> _signUpOnConsult(
      Future<String> Function() date) async {
    try {
      final model = await date();
      return Right(model);
    } catch (e) {
      return Left(ServerFailure(e is Failure ? e.message : e.toString()));
    }
  }
}
