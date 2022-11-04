import 'package:nursing_home/core/usecases/usecases.dart';
import 'package:nursing_home/features/tasks/domain/entities/task.dart';
import 'package:nursing_home/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllTasksUseCase implements StreamUseCase<Tasks, String> {
  GetAllTasksUseCase(this._tasksRepository);

  final TasksRepository _tasksRepository;

  @override
  Stream<Tasks> call({required String params}) {
    return _tasksRepository.getTasks(uid: params);
  }
}
