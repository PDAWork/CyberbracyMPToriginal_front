import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
