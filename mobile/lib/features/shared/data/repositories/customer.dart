import 'package:injectable/injectable.dart';
import 'package:mobile/features/shared/domain/repositories/customer.dart';
import 'package:mobile/generated/protos/event.pbgrpc.dart';

// TODO -> implement methods
@Injectable(as: BaseEventRepository)
class ProcheEventRepository extends BaseEventRepository {
  final EventServiceClient _client;

  ProcheEventRepository(this._client);
}
