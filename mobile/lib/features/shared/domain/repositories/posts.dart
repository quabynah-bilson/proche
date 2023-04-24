import 'package:dartz/dartz.dart';
import 'package:mobile/generated/protos/core_shared.pb.dart';

abstract class BasePostsRepository {
  Future<Either<GetPostsForUserResponse, String>> getPostsForUser(String id);

  Future<Either<GetPostsForUserResponse, String>> getPostsForCurrentUser();
}
