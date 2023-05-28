import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/data/datasource/consult_calendar_remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/controls_date.dart';
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
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}