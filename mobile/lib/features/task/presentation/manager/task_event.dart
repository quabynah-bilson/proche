part of 'task_bloc.dart';

abstract class TaskEvent {
  const TaskEvent();
}

class GetAllTasksEvent extends TaskEvent {
  final CommonAddress address;

  const GetAllTasksEvent(this.address);
}

class CreateTaskEvent extends TaskEvent {
  final CreateTaskRequest request;

  const CreateTaskEvent(this.request);
}

class DeleteTaskEvent extends TaskEvent {
  final String id;

  const DeleteTaskEvent(this.id);
}

class GetTaskEvent extends TaskEvent {
  final String taskId;

  const GetTaskEvent(this.taskId);
}

class GetCandidatesForTask extends TaskEvent {
  final String taskId;

  const GetCandidatesForTask(this.taskId);
}
class ApplyForTaskEvent extends TaskEvent {
  final ApplyForTaskRequest request;

  const ApplyForTaskEvent(this.request);
}
