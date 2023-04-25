import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/utils/session.dart';
import 'package:mobile/features/shared/domain/repositories/posts.dart';
import 'package:mobile/generated/protos/core_shared.pbgrpc.dart';
import 'package:protobuf_google/protobuf_google.dart';

@Injectable(as: BasePostsRepository)
class ProchePostsRepository extends BasePostsRepository {
  final CoreSharedServiceClient _client;

  ProchePostsRepository(this._client);

  @override
  Future<Either<GetPostsForUserResponse, String>>
      getPostsForCurrentUser() async {
    try {
      var response = await _client.get_posts_for_current_user(Empty(),
          options: CallOptions(metadata: {
            'x-account-id': UserSession.kUserId ??=
                throw GrpcError.unauthenticated()
          }));
      return left(response);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<GetPostsForUserResponse, String>> getPostsForUser(
      String id) async {
    try {
      var response = await _client.get_posts_for_user(StringValue(value: id));
      return left(response);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }
}
