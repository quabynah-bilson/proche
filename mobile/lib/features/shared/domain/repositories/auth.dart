import 'package:dartz/dartz.dart';
import 'package:mobile/generated/protos/auth.pb.dart';

abstract class BaseAuthRepository {
  Future<Either<void, String>> login({
    required String phoneNumber,
    required String password,
    required String countryId,
  });

  Future<Either<void, String>> logout();

  Future<Either<void, String>> register({
    required String phoneNumber,
    required String password,
    required String displayName,
    required String countryId,
    String? avatar,
  });

  Future<Either<Account, String>> getAccountByPhoneNumber(String phoneNumber);

  Future<Either<Account, String>> getCurrentAccount();

  Future<Either<void, String>> resetPassword(
      {required String phoneNumber, required String password});

  Future<Either<void, String>> sendVerificationCode(String phoneNumber);

  Future<Either<void, String>> verifyPhoneNumber(
      {required String phoneNumber, required String code});

  Future<Either<void, String>> getPublicAccessToken();

  Future<Either<String, String>> getReferralCode();

  Future<Either<List<Country>, String>> getCountries();

  Future<Either<Country, String>> getCountryById(String id);
}
