import 'package:todo_bloc/features/task/data/dtos/post_task_dto.dart';
import 'package:todo_bloc/features/task/data/dtos/update_task_dto.dart';
import 'package:todo_bloc/features/task/data/models/task_model.dart';

abstract class ITaskRepository {
  Future<List<TaskModel>> getAllTasks();

  Future<String?> postTask(PostTaskDto task);

  Future<String?> deleteTask(String taskId);

  Future<String?> updateTask(UpdateTaskDto newTask);
}
