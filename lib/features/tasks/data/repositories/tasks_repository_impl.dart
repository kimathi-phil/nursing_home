import 'package:nursing_home/features/tasks/data/models/task_model.dart';
import 'package:nursing_home/features/tasks/data/remote_sources/firestore_remote.dart';
import 'package:nursing_home/features/tasks/domain/entities/task.dart';
import 'package:nursing_home/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TasksRepository)
class TasksRepositoryImpl implements TasksRepository {
  @override
  Future<void> addTask({required TaskModel task}) async {
    try {
      return await FireStoreRemote.addTask(task: task);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Stream<List<Task>> getTasks({required String uid}) {
    try {
      return FireStoreRemote.getTasks(uid: uid)
          .map((storedAlbums) => storedAlbums.toEntities());
    } catch (e) {
      return Stream.error(e.toString());
    }
  }
}
