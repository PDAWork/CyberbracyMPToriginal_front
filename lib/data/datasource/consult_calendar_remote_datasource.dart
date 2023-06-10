import 'package:cyberbracy_mpt_original_front/domain/entity/consult_date.dart';

abstract interface class ConsultCalendarRemoteDataSource {
  ///Get consult dates by id
  ///
  ///Throws [ServerException] for all code errors
  Future<List<ConsultDates>> getConsultDates(int id);

  ///Get all availible consult dates by lowName
  ///
  ///Throws [ServerException] for all code errors
  Future<List<ConsultDates>> getAllConsultDates(String lowName);

  ///Sign up on consult
  ///
  ///Throws [ServerException] for all code errors
  Future<String> signUpOnConsult(int userId, String lowName, int idControl,
      int idRequire, int timestamp, String question);

  Future<String> confirmConsult(int userId, int timestamp, String lowName);
}
