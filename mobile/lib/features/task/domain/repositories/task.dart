import 'package:dartz/dartz.dart';
import 'package:mobile/generated/protos/core_shared.pb.dart';
import 'package:mobile/generated/protos/task.pb.dart';

abstract class BaseTaskRepository {
  Future<Either<ProcheTask, String>> createTask(CreateTaskRequest request);

  Future<Either<Stream<ProcheTask>, String>> getTask(String id);

  Future<Either<Stream<List<ProcheTask>>, String>> getAllTasks(
      CommonAddress address);
}
