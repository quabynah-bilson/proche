import 'package:dartz/dartz.dart';
import 'package:mobile/generated/protos/core_shared.pb.dart';
import 'package:protobuf_google/protobuf_google.dart';

abstract class BaseTaskRepository {
  Future<Either<ProcheTask, String>> createTask(CreateTaskRequest request);

  Future<Either<Stream<ProcheTask>, String>> getTask(String id);

  Future<Either<Empty, String>> deleteTask(String id);

  Future<Either<Stream<List<TaskCandidate>>, String>> getCandidatesForTask(
      String id);

  Future<Either<Stream<List<ProcheTask>>, String>> getAllTasks(
      CommonAddress address);

  Future<Either<Stream<List<ProcheTask>>, String>> getAllTasksForCurrentUser();

  Future<Either<void, String>> applyForTask(ApplyForTaskRequest request);
}
