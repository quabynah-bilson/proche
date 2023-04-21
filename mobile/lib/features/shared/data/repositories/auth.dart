import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/utils/image.utils.dart';
import 'package:mobile/core/utils/session.dart';
import 'package:mobile/features/shared/domain/repositories/auth.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';
import 'package:mobile/features/shared/domain/repositories/messaging.dart';
import 'package:mobile/generated/protos/auth.pbgrpc.dart';
import 'package:protobuf_google/protobuf_google.dart';
import 'package:shared_utils/shared_utils.dart';

@Injectable(as: BaseAuthRepository)
class ProcheAuthRepository extends BaseAuthRepository {
  final AuthServiceClient client;
  final BaseLocalStorageRepository storage;
  final BaseMessagingRepository messaging;

  ProcheAuthRepository({
    required this.client,
    required this.storage,
    required this.messaging,
  });

  @override
  Future<Either<Account, String>> getAccountByPhoneNumber(
      String phoneNumber) async {
    try {
      var account = await client
          .get_account_by_phone_number(StringValue(value: phoneNumber));
      return left(account);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<void, String>> getPublicAccessToken() async {
    try {
      var token = await client.request_public_access_token(Empty());

      // save token
      await storage.saveAccessToken(token.value);
      UserSession.kAccessToken = token.value;
      UserSession.kIsLoggedIn = token.value.isNotEmpty;

      return left(null);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<String, String>> getReferralCode() async {
    try {
      var response = await client.get_referral_code(Empty());
      return left(response.value);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<void, String>> login({
    required String phoneNumber,
    required String password,
    required String countryId,
  }) async {
    try {
      final request = LoginRequest(
        phoneNumber: phoneNumber,
        password: password,
        countryId: countryId,
      );
      var token = await client.login(request);

      // save token
      await storage.saveAccessToken(token.value);
      UserSession.kAccessToken = token.value;
      UserSession.kIsLoggedIn = token.value.isNotEmpty;

      _getCurrentAccountAndUpdateMessagingToken();

      return left(null);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<void, String>> logout() async {
    try {
      await client.logout(Empty());

      // clear token
      await storage.clearAccessToken();
      UserSession.kAccessToken = null;
      UserSession.kIsLoggedIn = false;
      messaging.clearToken();

      return left(null);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<void, String>> register({
    required String phoneNumber,
    required String password,
    required String displayName,
    required String countryId,
    String? avatar,
  }) async {
    try {
      final request = RegisterRequest(
        phoneNumber: phoneNumber,
        password: password,
        displayName: displayName,
        avatarUrl: avatar.isNullOrEmpty() ? null : await assetToBytes(avatar!),
        countryId: countryId,
      );
      var token = await client.register(request);

      // save token
      await storage.saveAccessToken(token.value);
      UserSession.kAccessToken = token.value;
      UserSession.kIsLoggedIn = token.value.isNotEmpty;

      _getCurrentAccountAndUpdateMessagingToken();

      return left(null);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<void, String>> resetPassword({
    required String phoneNumber,
    required String password,
    bool isPublic = true,
  }) async {
    try {
      final request =
          ResetPasswordRequest(phoneNumber: phoneNumber, password: password);
      var token = await client.reset_password(request);

      // save token
      if (!isPublic) {
        await storage.saveAccessToken(token.value);
        UserSession.kAccessToken = token.value;
        UserSession.kIsLoggedIn = token.value.isNotEmpty;
      }

      return left(null);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<void, String>> sendVerificationCode(String phoneNumber) async {
    try {
      await client
          .send_phone_verification_code(StringValue(value: phoneNumber));
      return left(null);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<void, String>> verifyPhoneNumber(
      {required String phoneNumber, required String code}) async {
    try {
      final request =
          VerifyPhoneRequest(phoneNumber: phoneNumber, verificationCode: code);
      await client.verify_phone_verification_code(request);
      return left(null);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Account, String>> getCurrentAccount() async {
    try {
      UserSession.kAccessToken = await storage.accessToken;
      UserSession.kLocale = await storage.defaultLocale;
      UserSession.kIsLoggedIn = !UserSession.kAccessToken.isNullOrEmpty();
      var account = await client.get_account(Empty());
      return left(account);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<List<Country>, String>> getCountries() async {
    try {
      var response = await client.get_countries(Empty());
      return left(response.countries);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Country, String>> getCountryById(String id) async {
    try {
      var response = await client.get_country_by_id(StringValue(value: id));
      return left(response);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<void, String>> verifyPassword(String password) async {
    try {
      await client.verify_password(StringValue(value: password));
      return left(null);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Account, String>> updateAccount(Account account) async {
    try {
      var updatedAccount = await client.update_account(account);
      return left(updatedAccount);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Account, String>> getAccountById(String id) async {
    try {
      var account = await client.get_account_by_id(StringValue(value: id));
      return left(account);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  void _getCurrentAccountAndUpdateMessagingToken() async {
    try {
      var account = await client.get_account(Empty());

      // get device token and update account
      var either = await messaging.getDeviceToken();
      var deviceToken = either.fold((l) => l, (r) => null);
      account.deviceToken = deviceToken ?? '';

      // get device id and update account
      either = await messaging.getDeviceId();
      var deviceId = either.fold((l) => l, (r) => null);
      account.deviceId = deviceId ?? '';

      // get device type and update account
      either = await messaging.getDeviceType();
      var deviceType = either.fold((l) => l, (r) => null);
      account.deviceType = deviceType ?? '';

      // save updated account
      var updatedAccount = await client.update_account(account);
      logger.i(
          'account updated successfully -> ${updatedAccount.deviceType} : ${updatedAccount.deviceId} -> ${updatedAccount.deviceToken}');
    } on GrpcError catch (e) {
      logger.e(e);
    }
  }
}
