import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';
import 'package:mobile/features/shared/domain/repositories/messaging.dart';
import 'package:mobile/generated/protos/auth.pbgrpc.dart';
import 'package:mobile/generated/protos/media.pbgrpc.dart';
import 'package:mobile/generated/protos/sms.pbgrpc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:protobuf_google/protobuf_google.dart';

import 'shared.dart';

/// region mocks
class MockAuthServiceClient extends Mock implements AuthServiceClient {}

class MockSmsServiceClient extends Mock implements SmsServiceClient {}

class MockMediaServiceClient extends Mock implements MediaServiceClient {}

class MockLocalRepository extends Mock implements BaseLocalStorageRepository {}

class MockMessagingRepository extends Mock implements BaseMessagingRepository {}

/// endregion mocks

void main() {
  late final AuthServiceClient _authServiceClient;
  // late final SmsServiceClient _smsServiceClient;
  // late final MediaServiceClient _mediaServiceClient;
  // late final BaseLocalStorageRepository _localStorageRepository;
  // late final BaseMessagingRepository _messagingRepository;

  setUpAll(() {
    _authServiceClient = MockAuthServiceClient();
    // _smsServiceClient = MockSmsServiceClient();
    // _mediaServiceClient = MockMediaServiceClient();
    // _localStorageRepository = MockLocalRepository();
    // _messagingRepository = MockMessagingRepository();
  });

  group('test auth repository', () {
    const phoneNumber = '0554022344';

    test('get account by phone number', () async {
      final request = StringValue(value: phoneNumber);
      final response = Account();
      when(() => _authServiceClient.get_account_by_phone_number(request))
          .thenAnswer((_) => MockResponseFuture<Account>(response));
      final result =
          await _authServiceClient.get_account_by_phone_number(request);
      expect(result, isA<Account>());
    });

    test('get public access token', () async {
      final request = Empty();
      final response = StringValue(value: '1234');
      when(() => _authServiceClient.request_public_access_token(request))
          .thenAnswer((_) => MockResponseFuture<StringValue>(response));
      final result =
          await _authServiceClient.request_public_access_token(request);
      expect(result, isA<StringValue>());
    });

    test('get referral code', () async {
      final request = Empty();
      final response = StringValue(value: '1234');
      when(() => _authServiceClient.get_referral_code(request))
          .thenAnswer((_) => MockResponseFuture<StringValue>(response));
      final result = await _authServiceClient.get_referral_code(request);
      expect(result, isA<StringValue>());
    });

    test('login with phone number & password', () async {
      final request = LoginRequest(
        phoneNumber: phoneNumber,
        countryId: 'gh-sample-id',
        password: '1234',
      );
      final response = StringValue(value: 'sample-token');
      when(() => _authServiceClient.login(request)).thenAnswer(
          (invocation) => MockResponseFuture<StringValue>(response));
      final result = await _authServiceClient.login(request);
      expect(result, isA<StringValue>());
    });
  });
}
