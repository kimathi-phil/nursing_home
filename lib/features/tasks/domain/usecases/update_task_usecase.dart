import 'package:nursing_home/core/usecases/usecases.dart';
import 'package:nursing_home/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateTaskUseCase
    implements UseCaseTwoParams<void, String, Map<String, dynamic>> {
  UpdateTaskUseCase(this._tasksRepository);

  final TasksRepository _tasksRepository;

  @override
  Future<void> call({
    required String paramsOne,
    required Map<String, dynamic> paramsTwo,
  }) {
    return _tasksRepository.updateTask(uid: paramsOne, updateInfo: paramsTwo);
  }
}
