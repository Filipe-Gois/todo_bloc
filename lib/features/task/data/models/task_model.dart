import 'dart:convert';

import 'package:todo_bloc/features/task/data/enums/TaskStatus.dart';

class TaskModel {
  final String id;
  final String name;
  final TaskStatus status;

  TaskModel({required this.id, required this.name, required this.status});

  factory TaskModel.fromMap(Map<String, dynamic> map) =>
      TaskModel(id: map["id"], name: map["name"], status: map["status"]);

  factory TaskModel.fromJson(String src) => TaskModel.fromMap(jsonDecode(src));

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "status": status.index,
  };

  String toJson() => jsonEncode(toMap());
}
