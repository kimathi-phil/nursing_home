import 'package:nursing_home/core/usecases/usecases.dart';
import 'package:nursing_home/features/residents/domain/entities/resident.dart';
import 'package:nursing_home/features/residents/domain/repositories/residents_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllResidentsUseCase implements StreamUseCase<Residents, String> {
  GetAllResidentsUseCase(this._residentsRepository);

  final ResidentsRepository _residentsRepository;

  @override
  Stream<Residents> call({required String params}) {
    return _residentsRepository.getResidents();
  }
}
