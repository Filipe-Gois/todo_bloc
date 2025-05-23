import '../enums/TaskStatus.dart';

class PostTaskDto {
  final String name;
  final TaskStatus status;

  PostTaskDto({required this.name, required this.status});
}
