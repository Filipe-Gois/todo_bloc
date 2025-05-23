import 'package:flutter/material.dart';
import 'package:todo_bloc/core/providers/http_client.dart';
import 'package:todo_bloc/core/router/app_router.dart';
import 'package:todo_bloc/core/router/app_routes.dart';
import 'package:todo_bloc/features/task/domain/interfaces/i_task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/features/task/domain/repositories/task_repository.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_bloc.dart';

void main() {
  final client = createHttpClient();
  final repository = TaskRepository(client: client);
  runApp(MyApp(taskRepository: repository));
}

class MyApp extends StatelessWidget {
  final ITaskRepository taskRepository;

  const MyApp({super.key, required this.taskRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => TaskBloc(taskRepository))],
      child: MaterialApp(
        title: "To-do List",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutes.taskScreenRoute,

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
