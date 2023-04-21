

import 'package:dartz/dartz.dart';
import 'package:mobile/generated/protos/shared.pb.dart';

abstract class BaseSharedRepository {
  Future<Either<AppVersion, String>> checkForUpdates();
}