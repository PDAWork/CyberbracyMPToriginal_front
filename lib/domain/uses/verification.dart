
import 'package:cyberbracy_mpt_original_front/domain/repositories/repository.dart';
import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/core/usecase.dart';
import 'package:dartz/dartz.dart';

class Verification extends UseCase<void, VerificationParams>{
  final Repository repository;

  Verification({required this.repository});
  @override
  Future<Either<Failure, void>> call(VerificationParams params) async {
    return await repository.verificationCode(id: params.id, code: params.code);
  }

}

class VerificationParams {
  final int id;
  final String code;

  VerificationParams({required this.id, required this.code});
}
