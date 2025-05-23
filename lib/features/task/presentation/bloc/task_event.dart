import 'package:todo_bloc/features/task/data/dtos/post_task_dto.dart';
import 'package:todo_bloc/features/task/data/dtos/update_task_dto.dart';

abstract class TaskEvent {}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final PostTaskDto taskDto;

  AddTask({required this.taskDto});
}

class UpdateTask extends TaskEvent {
  final UpdateTaskDto task;

  UpdateTask({required this.task});
}

class DeleteTask extends TaskEvent {
  final String id;

  DeleteTask({required this.id});
}
