import 'package:dartz/dartz.dart';
import 'package:mobile/generated/protos/auth.pb.dart';

abstract class BaseBusinessRepository {
  Future<Either<BusinessAccount, String>> registerBusiness({
    required String specialization,
    required double hourlyCharge,
  });

  Future<Either<BusinessAccount, String>> updateBusinessAccount(
      BusinessAccount account);

  Future<Either<void, String>> deleteBusinessAccount(String id);

  Future<Either<BusinessAccount, String>> getBusinessAccount(String ownerId);

  Future<Either<BusinessAccount, String>> getBusinessAccountForCurrentUser();
}
