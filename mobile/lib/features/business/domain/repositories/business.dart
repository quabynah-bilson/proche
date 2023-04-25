import 'package:dartz/dartz.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:protobuf_google/protobuf_google.dart';

abstract class BaseBusinessRepository {
  Future<Either<BusinessAccount, String>> registerBusiness({
    required String specialization,
    required double hourlyCharge,
  });

  Future<Either<BusinessAccount, String>> updateBusinessAccount(
      BusinessAccount account);

  Future<Either<Empty, String>> deleteBusinessAccount(String id);

  Future<Either<BusinessAccount, String>> getBusinessAccount(String ownerId);

  Future<Either<BusinessAccount, String>> getBusinessAccountForCurrentUser();
}
