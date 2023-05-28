import 'package:cyberbracy_mpt_original_front/domain/entity/controls_date.dart';

abstract interface class ConsultCalendarRemoteDataSource {
  ///Get consult dates by id
  ///
  ///Throws [ServerException] for all code errors
  Future<List<ConsultDates>> getConsultDates(int id);
}
