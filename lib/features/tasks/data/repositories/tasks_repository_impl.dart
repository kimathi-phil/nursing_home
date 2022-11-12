import 'package:nursing_home/features/tasks/data/models/task_model.dart';
import 'package:nursing_home/features/tasks/data/remote_sources/firestore_remote_tasks.dart';
import 'package:nursing_home/features/tasks/domain/entities/task.dart';
import 'package:nursing_home/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TasksRepository)
class TasksRepositoryImpl implements TasksRepository {
  @override
  Future<void> addTask({required TaskModel task}) async {
    try {
      return await FireStoreRemoteTasks.addTask(task: task);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Stream<List<Task>> getTasks({required String uid}) {
    try {
      return FireStoreRemoteTasks.getTasks(uid: uid)
          .map((tasks) => tasks.toEntities());
    } catch (e) {
      return Stream.error(e.toString());
    }
  }

  @override
  Future<void> updateTask({
    required String uid,
    required Map<String, dynamic> updateInfo,
  }) async {
    try {
      return await FireStoreRemoteTasks.updateTask(
        uid: uid,
        updateInfo: updateInfo,
      );
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
