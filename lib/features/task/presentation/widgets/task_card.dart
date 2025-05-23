import 'package:flutter/material.dart';
import 'package:todo_bloc/features/task/data/enums/TaskStatus.dart';
import 'package:todo_bloc/features/task/data/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: Colors.black, fontSize: 20);

    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .25),
            blurRadius: 10,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.white.withValues(alpha: .05),
            blurRadius: 10,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(task.id, style: style),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: VerticalDivider(),
            ),
            Text(task.name, style: style),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: VerticalDivider(),
            ),
            Text(taskStatusValidate(task.status), style: style),
          ],
        ),
      ),
    );
  }
}

String taskStatusValidate(TaskStatus status) {
  switch (status) {
    case TaskStatus.Fazer:
      return "Fazer";
    case TaskStatus.Fazendo:
      return "Fazendo";
    default:
      return "Feito";
  }
}
