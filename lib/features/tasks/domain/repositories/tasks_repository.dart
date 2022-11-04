import 'package:nursing_home/features/tasks/data/models/task_model.dart';
import 'package:nursing_home/features/tasks/domain/entities/task.dart';

abstract class TasksRepository {
  Future<void> addTask({required TaskModel task});
  Stream<List<Task>> getTasks({required String uid});
}
