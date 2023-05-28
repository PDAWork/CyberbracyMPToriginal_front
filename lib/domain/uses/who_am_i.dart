import 'package:cyberbracy_mpt_original_front/core/const/types.dart';
import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/core/usecase.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/who_am_i.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class WhoAmI extends UseCase<UserId, WhoAmIParams> {
  final WhoAmIRepository _whoAmIRepository;

  WhoAmI(this._whoAmIRepository);
  @override
  Future<Either<Failure, UserId>> call(WhoAmIParams params) {
    return _whoAmIRepository.whoAmI();
  }
}

class WhoAmIParams extends Equatable {
  @override
  List<Object?> get props => [id];
}
