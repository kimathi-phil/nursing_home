import 'package:nursing_home/core/usecases/usecases.dart';
import 'package:nursing_home/features/tasks/data/data.dart';
import 'package:nursing_home/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddNewTaskUseCase implements UseCase<void, TaskModel> {
  AddNewTaskUseCase(this._tasksRepository);

  final TasksRepository _tasksRepository;

  @override
  Future<void> call({required TaskModel params}) {
    return _tasksRepository.addTask(task: params);
  }
}
