import 'package:cyberbracy_mpt_original_front/core/const/types.dart';

abstract interface class WhoAmIRemoteDataSource {
  Future<UserId> whoAmI();
}
