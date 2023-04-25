import 'package:dartz/dartz.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:protobuf_google/protobuf_google.dart';

abstract class BaseAuthRepository {
  Future<Either<Empty, String>> login({
    required String phoneNumber,
    required String password,
    required String countryId,
  });

  Future<Either<Empty, String>> verifyPassword(String password);

  Future<Either<Empty, String>> logout();

  Future<Either<Empty, String>> register({
    required String phoneNumber,
    required String password,
    required String displayName,
    required String countryId,
    String? avatar,
  });

  Future<Either<Account, String>> getAccountByPhoneNumber(String phoneNumber);

  Future<Either<Account, String>> getAccountById(String id);

  Future<Either<Account, String>> getCurrentAccount();

  Future<Either<Account, String>> updateAccount(Account account);

  Future<Either<Empty, String>> resetPassword({
    required String phoneNumber,
    required String password,
    bool isPublic,
  });

  Future<Either<Empty, String>> sendVerificationCode(String phoneNumber);

  Future<Either<Empty, String>> verifyPhoneNumber(
      {required String phoneNumber, required String code});

  Future<Either<Empty, String>> getPublicAccessToken();

  Future<Either<String, String>> getReferralCode();

  Future<Either<List<Country>, String>> getCountries();

  Future<Either<Country, String>> getCountryById(String id);
}
