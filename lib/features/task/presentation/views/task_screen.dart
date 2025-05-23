import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_bloc.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_event.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_state.dart';
import 'package:todo_bloc/features/task/presentation/widgets/task_card.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(LoadTasks());
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text("Bem-vindo!"), centerTitle: true),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (_, state) {
          if (state is TaskLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is TaskFailure) {
            return Center(child: Text(state.message));
          }

          if (state is TasksLoaded) {
            final tasks = state.tasks;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: heightScreen,
                width: widthScreen,
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<TaskBloc>().add(LoadTasks());
                  },
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      final task = tasks[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TaskCard(task: task),
                      );
                    },
                    itemCount: tasks.length,
                  ),
                ),
              ),
            );
          }

          return Center(child: Text("Nenhuma tarefa encontrada!"));
        },
      ),
    );
  }
}
