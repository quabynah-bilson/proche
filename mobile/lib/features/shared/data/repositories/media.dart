import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/shared/domain/repositories/media.dart';
import 'package:mobile/generated/protos/media.pbgrpc.dart';
import 'package:shared_utils/shared_utils.dart';

@Injectable(as: BaseMediaRepository)
class ProcheMediaRepository extends BaseMediaRepository {
  final MediaServiceClient _client;

  ProcheMediaRepository(this._client);

  @override
  Future<Either<String, String>> uploadMedia(UploadMediaRequest request) async {
    try {
      var response = await _client.upload_media(request);
      return left(response.value);
    } on GrpcError catch (e) {
      logger.e(e);
      return right(e.message ?? e.codeName);
    }
  }
}
