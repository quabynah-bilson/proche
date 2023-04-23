

import 'package:dartz/dartz.dart';
import 'package:mobile/generated/protos/media.pb.dart';

abstract class BaseMediaRepository {
  Future<Either<String, String>> uploadMedia(UploadMediaRequest request);
}