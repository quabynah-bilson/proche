import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/utils/session.dart';
import 'package:mobile/features/task/domain/repositories/task.dart';
import 'package:mobile/generated/protos/core_shared.pb.dart';
import 'package:mobile/generated/protos/task.pbgrpc.dart';
import 'package:protobuf_google/protobuf_google.dart';

@Injectable(as: BaseTaskRepository)
class ProcheTaskRepository extends BaseTaskRepository {
  final TaskServiceClient client;

  ProcheTaskRepository(this.client);

  @override
  Future<Either<ProcheTask, String>> createTask(
      CreateTaskRequest request) async {
    try {
      var procheTask = await client.create_task(request);
      return left(procheTask);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Stream<List<ProcheTask>>, String>> getAllTasks(
      CommonAddress address) async {
    try {
      var stream = client.get_tasks(
        address,
        options: CallOptions(metadata: {
          'x-page': '${QuickHelpSession.kTasksPage}',
          'x-per-page': '${QuickHelpSession.kTasksPerPage}',
        }),
      );

      return left(stream.map((event) => event.tasks));
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Stream<ProcheTask>, String>> getTask(String id) async {
    try {
      var procheTask = client.get_task(StringValue(value: id));
      return left(procheTask);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }
}