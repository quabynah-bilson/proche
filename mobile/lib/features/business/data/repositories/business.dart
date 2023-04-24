import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/business/domain/repositories/business.dart';
import 'package:mobile/generated/protos/auth.pb.dart';

@Injectable(as: BaseBusinessRepository)
class ProcheBusinessRepository extends BaseBusinessRepository {
  @override
  Future<Either<void, String>> deleteBusinessAccount(String id) {
    // TODO: implement deleteBusinessAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<BusinessAccount, String>> getBusinessAccount(String ownerId) {
    // TODO: implement getBusinessAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<BusinessAccount, String>> getBusinessAccountForCurrentUser() {
    // TODO: implement getBusinessAccountForCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<BusinessAccount, String>> registerBusiness(
      {required String specialization, required double hourlyCharge}) {
    // TODO: implement registerBusiness
    throw UnimplementedError();
  }

  @override
  Future<Either<BusinessAccount, String>> updateBusinessAccount(
      BusinessAccount account) {
    // TODO: implement updateBusinessAccount
    throw UnimplementedError();
  }
}
