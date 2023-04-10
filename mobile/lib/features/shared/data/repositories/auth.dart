import 'package:injectable/injectable.dart';
import 'package:mobile/features/shared/domain/repositories/auth.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';
import 'package:mobile/generated/protos/auth.pbgrpc.dart';

@Injectable(as: BaseAuthRepository)
class ProcheAuthRepository extends BaseAuthRepository {
  final AuthServiceClient client;
  final BaseLocalStorageRepository storage;

  ProcheAuthRepository({required this.client, required this.storage});
}
