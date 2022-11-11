import 'package:nursing_home/core/usecases/usecases.dart';
import 'package:nursing_home/features/status/domain/entities/status.dart';
import 'package:nursing_home/features/status/domain/repositories/status_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllStatusUseCase implements StreamUseCase<Statuses, String> {
  GetAllStatusUseCase(this._statusRepository);

  final StatusRepository _statusRepository;

  @override
  Stream<Statuses> call({required String params}) {
    return _statusRepository.getStatus();
  }
}
