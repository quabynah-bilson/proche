import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/features/shared/domain/repositories/shared.dart';
import 'package:mobile/generated/protos/shared.pbgrpc.dart';
import 'package:protobuf_google/protobuf_google.dart';

@Injectable(as: BaseSharedRepository)
class ProcheSharedRepository extends BaseSharedRepository {
  final SharedServiceClient client;

  ProcheSharedRepository(this.client);


  @override
  Future<Either<AppVersion, String>> checkForUpdates() async {
    try {
      final response = await client.checkForUpdates(
          StringValue(value: getIt<String>(instanceName: 'app_version')));
      return Left(response);
    } on GrpcError catch (e) {
      return Right(e.message ?? e.codeName);
    }
  }
}
