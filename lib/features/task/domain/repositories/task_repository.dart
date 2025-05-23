import 'dart:convert';
import 'package:todo_bloc/features/task/data/dtos/post_task_dto.dart';
import 'package:todo_bloc/features/task/data/dtos/update_task_dto.dart';
import 'package:todo_bloc/features/task/data/models/task_model.dart';
import 'package:todo_bloc/features/task/domain/interfaces/i_task_repository.dart';
import "package:http/http.dart" as http;

class TaskRepository implements ITaskRepository {
  final http.Client client;

  TaskRepository({required this.client});

  final String _baseUrl = "http://172.16.43.115:3000/tasks";

  @override
  Future<String?> deleteTask(String taskId) async {
    try {
      final response = await client.delete(
        Uri.parse(_baseUrl),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        return null;
      }

      return "Erro ao deletar tarefa!";
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    try {
      List<TaskModel> tasks = [];
      final response = await client.get(
        Uri.parse(_baseUrl),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;

        for (final task in data) {
          tasks.add(TaskModel.fromMap(task));
        }
        return tasks;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<String?> postTask(PostTaskDto task) async {
    try {
      final response = await client.post(
        Uri.parse(_baseUrl),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        return "Erro ao cadastrar tarefa.";
      }

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String?> updateTask(UpdateTaskDto newTask) async {
    try {
      final response = await client.put(
        Uri.parse(_baseUrl),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        return "Erro ao atualizar tarefa.";
      }

      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
