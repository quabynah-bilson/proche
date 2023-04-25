import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/utils/image.utils.dart';
import 'package:mobile/core/utils/session.dart';
import 'package:mobile/features/shared/domain/repositories/auth.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';
import 'package:mobile/features/shared/domain/repositories/messaging.dart';
import 'package:mobile/generated/protos/auth.pbgrpc.dart';
import 'package:mobile/generated/protos/media.pbgrpc.dart';
import 'package:mobile/generated/protos/sms.pbgrpc.dart';
import 'package:protobuf_google/protobuf_google.dart';
import 'package:shared_utils/shared_utils.dart';

@Injectable(as: BaseAuthRepository)
class ProcheAuthRepository extends BaseAuthRepository {
  final AuthServiceClient authClient;
  final SmsServiceClient smsClient;
  final MediaServiceClient mediaClient;
  final BaseLocalStorageRepository storage;
  final BaseMessagingRepository messaging;

  ProcheAuthRepository({
    required this.authClient,
    required this.smsClient,
    required this.mediaClient,
    required this.storage,
    required this.messaging,
  });

  @override
  Future<Either<Account, String>> getAccountByPhoneNumber(
      String phoneNumber) async {
    try {
      var account = await authClient
          .get_account_by_phone_number(StringValue(value: phoneNumber));
      return left(account);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Empty, String>> getPublicAccessToken() async {
    try {
      var token = await authClient.request_public_access_token(Empty());

      // save token
      await storage.saveAccessToken(token.value);
      UserSession.kAccessToken = token.value;
      UserSession.kIsLoggedIn = token.value.isNotEmpty;

      return left(Empty());
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<String, String>> getReferralCode() async {
    try {
      var response = await authClient.get_referral_code(Empty());
      return left(response.value);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Empty, String>> login({
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
      var token = await authClient.login(request);

      // save token
      await storage.saveAccessToken(token.value);
      UserSession.kAccessToken = token.value;
      UserSession.kIsLoggedIn = token.value.isNotEmpty;

      _getCurrentAccountAndUpdateMessagingToken();

      return left(Empty());
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Empty, String>> logout() async {
    try {

      // unsubscribe from notifications
      var account = await authClient.get_account(Empty());
      await messaging.clearToken(account.phoneNumber);

      var empty = await authClient.logout(Empty());

      // clear token
      await storage.clearAccessToken();
      UserSession.kAccessToken = null;
      UserSession.kIsLoggedIn = false;
      await messaging.unsubscribeFromNotifications();

      return left(empty);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Empty, String>> register({
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
      var token = await authClient.register(request);

      // save token
      await storage.saveAccessToken(token.value);
      UserSession.kAccessToken = token.value;
      UserSession.kIsLoggedIn = token.value.isNotEmpty;

      _getCurrentAccountAndUpdateMessagingToken();

      return left(Empty());
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Empty, String>> resetPassword({
    required String phoneNumber,
    required String password,
    bool isPublic = true,
  }) async {
    try {
      final request =
          ResetPasswordRequest(phoneNumber: phoneNumber, password: password);
      var token = await authClient.reset_password(request);

      // save token
      if (!isPublic) {
        await storage.saveAccessToken(token.value);
        UserSession.kAccessToken = token.value;
        UserSession.kIsLoggedIn = token.value.isNotEmpty;
      }

      return left(Empty());
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Empty, String>> sendVerificationCode(String phoneNumber) async {
    try {
      var empty = await smsClient
          .send_phone_verification_code(StringValue(value: phoneNumber));
      return left(empty);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Empty, String>> verifyPhoneNumber(
      {required String phoneNumber, required String code}) async {
    try {
      final request =
          VerifyPhoneRequest(phoneNumber: phoneNumber, verificationCode: code);
      var empty = await smsClient.verify_phone_verification_code(request);
      return left(empty);
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
      var account = await authClient.get_account(Empty());
      UserSession.kUserId = account.id;
      return left(account);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<List<Country>, String>> getCountries() async {
    try {
      var response = await authClient.get_countries(Empty());
      return left(response.countries);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Country, String>> getCountryById(String id) async {
    try {
      var response = await authClient.get_country_by_id(StringValue(value: id));
      return left(response);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Empty, String>> verifyPassword(String password) async {
    try {
      var empty = await authClient.verify_password(StringValue(value: password));
      return left(empty);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Account, String>> updateAccount(Account account) async {
    try {
      // avatar
      if (!account.avatarUrl.isNullOrEmpty() &&
          account.avatarUrl.startsWith("assets/")) {
        var bytesToTransfer = await assetToBytes(account.avatarUrl);
        var response = await mediaClient.upload_media(UploadMediaRequest(
          media: bytesToTransfer,
          owner: account.phoneNumber,
          name: 'avatar',
          type: MediaType.IMAGE,
        ));
        account.avatarUrl = response.value;
      }

      // vaccine card
      if (account.vaccineCardUrl.isNotEmpty &&
          !account.vaccineCardUrl.startsWith('http')) {
        var bytesToTransfer = await fileToBytes(account.vaccineCardUrl);
        var response = await mediaClient.upload_media(UploadMediaRequest(
          media: bytesToTransfer,
          owner: account.phoneNumber,
          name: 'vaccine_card',
          type: MediaType.IMAGE,
        ));
        account.vaccineCardUrl = response.value;
      }

      // id card
      if (account.idCardUrl.isNotEmpty &&
          !account.idCardUrl.startsWith('http')) {
        var bytesToTransfer = await fileToBytes(account.idCardUrl);
        var response = await mediaClient.upload_media(UploadMediaRequest(
          media: bytesToTransfer,
          owner: account.phoneNumber,
          name: 'id_card',
          type: MediaType.IMAGE,
        ));
        account.idCardUrl = response.value;
      }

      var updatedAccount = await authClient.update_account(account);
      return left(updatedAccount);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Account, String>> getAccountById(String id) async {
    try {
      var account = await authClient.get_account_by_id(StringValue(value: id));
      return left(account);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  void _getCurrentAccountAndUpdateMessagingToken() async {
    try {
      var account = await authClient.get_account(Empty());

      // get device token and update account
      var either = await messaging.getDeviceToken(account.phoneNumber);
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
      var updatedAccount = await authClient.update_account(account);
      await messaging.subscribeToNotifications(updatedAccount.phoneNumber);
    } on GrpcError catch (e) {
      logger.e(e);
    }
  }
}
