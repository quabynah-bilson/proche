import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/shared/domain/repositories/auth.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';
import 'package:mobile/generated/protos/auth.pbgrpc.dart';

@Injectable(as: BaseAuthRepository)
class ProcheAuthRepository extends BaseAuthRepository {
  final AuthServiceClient client;
  final BaseLocalStorageRepository storage;

  ProcheAuthRepository({required this.client, required this.storage});

  @override
  Future<Either<Account, String>> getAccountByPhoneNumber(
      String phoneNumber) async {
    // TODO: implement getAccountByPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<Either<void, String>> getPublicAccessToken() async {
    // TODO: implement getPublicAccessToken
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> getReferralCode() async {
    // TODO: implement getReferralCode
    throw UnimplementedError();
  }

  @override
  Future<Either<void, String>> login(
      {required String phoneNumber, required String password}) async {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<void, String>> logout() async {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<void, String>> register(
      {required String phoneNumber,
      required String password,
      required String displayName,
      String? avatar}) async {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Either<void, String>> resetPassword(
      {required String phoneNumber, required String password}) async {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<void, String>> sendVerificationCode(String phoneNumber) async {
    // TODO: implement sendVerificationCode
    throw UnimplementedError();
  }

  @override
  Future<Either<void, String>> verifyPhoneNumber(
      {required String phoneNumber, required String code}) async {
    // TODO: implement verifyPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<Either<Account, String>> getCurrentAccount() async {
    // TODO: implement getCurrentAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<List<Country>, String>> getCountries() async {
    // TODO: implement getCountries
    throw UnimplementedError();
  }
}
