import 'package:bloc/bloc.dart';
import 'package:todo_bloc/features/task/domain/interfaces/i_task_repository.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_event.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final ITaskRepository taskRepository;

  TaskBloc(this.taskRepository) : super(TaskInitial()) {
    on<LoadTasks>((event, emit) async {
      emit(TaskLoading());
      try {
        final tasks = await taskRepository.getAllTasks();
        emit(TasksLoaded(tasks: tasks));
      } catch (e) {
        emit(TaskFailure(message: e.toString()));
      }
    });

    on<AddTask>((event, emit) async {
      try {
        await taskRepository.postTask(event.taskDto);
      } catch (e) {
        emit(TaskFailure(message: e.toString()));
      }
    });

    on<UpdateTask>((event, emit) async {
      try {
        await taskRepository.updateTask(event.task);
        add(LoadTasks());
      } catch (e) {
        emit(TaskFailure(message: e.toString()));
      }
    });

    on<DeleteTask>((event, emit) async {
      try {
        await taskRepository.deleteTask(event.id);
      } catch (e) {
        emit(TaskFailure(message: e.toString()));
      }
    });
  }
}
