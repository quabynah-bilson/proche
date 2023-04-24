import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/utils/session.dart';
import 'package:mobile/features/business/domain/repositories/business.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';
import 'package:mobile/generated/protos/auth.pbgrpc.dart';
import 'package:protobuf_google/protobuf_google.dart';

@Injectable(as: BaseBusinessRepository)
class ProcheBusinessRepository extends BaseBusinessRepository {
  final BaseLocalStorageRepository _storage;
  final AuthServiceClient _client;

  ProcheBusinessRepository(this._storage, this._client);

  @override
  Future<Either<Empty, String>> deleteBusinessAccount(String id) async {
    try {
      var empty = await _client.delete_business_account(StringValue(value: id));
      return left(empty);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<BusinessAccount, String>> getBusinessAccount(
      String ownerId) async {
    try {
      var businessAccount =
          await _client.get_business_account(StringValue(value: ownerId));
      return left(businessAccount);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<BusinessAccount, String>>
      getBusinessAccountForCurrentUser() async {
    try {
      var businessAccount = await _client.get_business_account(StringValue(
          value: UserSession.kUserId ??= throw GrpcError.unauthenticated()));
      return left(businessAccount);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<BusinessAccount, String>> registerBusiness(
      {required String specialization, required double hourlyCharge}) async {
    try {
      var request = CreateBusinessAccountRequest(
        accountId: UserSession.kUserId ??= throw GrpcError.unauthenticated(),
        specialization: specialization,
        hourlyRate: hourlyCharge,
      );
      var businessAccount = await _client.create_business_account(request);
      return left(businessAccount);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<BusinessAccount, String>> updateBusinessAccount(
      BusinessAccount account) async {
    try {
      var businessAccount = await _client.update_business_account(account);
      return left(businessAccount);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }
}
