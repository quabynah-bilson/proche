import 'package:dartz/dartz.dart';
import 'package:mobile/generated/protos/auth.pb.dart';

/// handles local storage of session data
abstract class BaseLocalStorageRepository {
  Future<Either<Session, String>> getCurrentSession();

  Future<Either<Account, String>> getCurrentAccount();

  Future<void> saveSession(Session session);

  Future<void> saveAccount(Account account);

  Future<void> clearSessionAndAccount();
}
