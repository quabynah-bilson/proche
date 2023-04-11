import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';
import 'package:mobile/generated/protos/auth.pb.dart';
import 'package:shared_utils/shared_utils.dart';

@Injectable(as: BaseLocalStorageRepository)
class ProcheLocalStorageRepository extends BaseLocalStorageRepository {
  final FlutterSecureStorage storage;
  final _kSessionKey = 'proche-session-key',
      _kAccountKey = 'proche-account-key',
      _kLocaleKey = 'proche-locale-key';

  ProcheLocalStorageRepository(this.storage);

  @override
  Future<Either<Session, String>> getCurrentSession() async {
    var sessionJson = await storage.read(key: _kSessionKey);
    if (sessionJson.isNullOrEmpty()) {
      return right('No session created');
    }
    var decodedSessionJson = json.decode(sessionJson!);
    return left(Session.getDefault()..mergeFromProto3Json(decodedSessionJson));
  }

  @override
  Future<void> saveSession(Session session) async {
    var encodedSessionJson = json.encode(session.toProto3Json());
    logger.d('writing session to persistent storage -> $encodedSessionJson');
    await storage.write(key: _kSessionKey, value: encodedSessionJson);
  }

  @override
  Future<void> clearSessionAndAccount() async {
    if (await storage.containsKey(key: _kSessionKey) &&
        await storage.containsKey(key: _kAccountKey)) {
      await storage.delete(key: _kSessionKey);
      await storage.delete(key: _kAccountKey);
    }
  }

  @override
  Future<Either<Account, String>> getCurrentAccount() async {
    var accountJson = await storage.read(key: _kAccountKey);
    if (accountJson.isNullOrEmpty()) {
      return right('No account found');
    }
    var decodedSessionJson = json.decode(accountJson!);
    return left(Account.getDefault()..mergeFromProto3Json(decodedSessionJson));
  }

  @override
  Future<void> saveAccount(Account account) async {
    var encodedAccountJson = json.encode(account.toProto3Json());
    logger.d('writing account to persistent storage -> $encodedAccountJson');
    await storage.write(key: _kAccountKey, value: encodedAccountJson);
  }

  @override
  Future<String> get defaultLocale async =>
      await storage.read(key: _kLocaleKey) ?? 'en';

  @override
  Future<void> setLocale(String locale) async =>
      await storage.write(key: _kLocaleKey, value: locale);
}
