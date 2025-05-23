import 'package:flutter/material.dart';
import 'package:todo_bloc/core/router/app_routes.dart';
import 'package:todo_bloc/features/task/presentation/views/task_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.taskScreenRoute:
        return MaterialPageRoute(builder: (_) => TaskScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text("404"))),
        );
    }
  }
}
