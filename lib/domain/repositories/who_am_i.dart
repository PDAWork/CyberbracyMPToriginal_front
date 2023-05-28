import 'package:cyberbracy_mpt_original_front/core/const/types.dart';
import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class WhoAmIRepository {
  Future<Either<Failure, UserId>> whoAmI();
}
