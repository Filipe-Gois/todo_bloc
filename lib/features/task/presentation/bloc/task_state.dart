import 'package:todo_bloc/features/task/data/models/task_model.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TasksLoaded extends TaskState {
  final List<TaskModel> tasks;

  TasksLoaded({required this.tasks});
}

class TaskFailure extends TaskState {
  final String message;

  TaskFailure({required this.message});
}
