import 'package:bloc/bloc.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/features/task/domain/repositories/task.dart';
import 'package:mobile/generated/protos/core_shared.pb.dart';
import 'package:protobuf_google/protobuf_google.dart';
import 'package:shared_utils/shared_utils.dart';

part 'task_event.dart';

class TaskBloc extends Bloc<TaskEvent, BlocState> {
  final _repository = getIt<BaseTaskRepository>();

  TaskBloc() : super(BlocState.initialState()) {
    on<CreateTaskEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repository.createTask(event.request);
      either.fold(
        (l) => emit(BlocState<ProcheTask>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<DeleteTaskEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repository.deleteTask(event.id);
      either.fold(
        (l) => emit(BlocState<Empty>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<GetAllTasksEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repository.getAllTasks(event.address);
      either.fold(
        (l) => emit(BlocState<Stream<List<ProcheTask>>>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<GetCandidatesForTask>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repository.getCandidatesForTask(event.taskId);
      either.fold(
        (l) =>
            emit(BlocState<Stream<List<TaskCandidate>>>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<GetTaskEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repository.getTask(event.taskId);
      either.fold(
        (l) => emit(BlocState<Stream<ProcheTask>>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<ApplyForTaskEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repository.applyForTask(event.request);
      either.fold(
        (l) => emit(BlocState<void>.successState(data: null)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });
  }
}
