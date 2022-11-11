import 'package:nursing_home/core/usecases/usecases.dart';
import 'package:nursing_home/features/shifts/domain/entities/shift.dart';
import 'package:nursing_home/features/shifts/domain/repositories/shifts_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllShiftsUseCase implements StreamUseCase<Shifts, String> {
  GetAllShiftsUseCase(this._shiftsRepository);

  final ShiftsRepository _shiftsRepository;

  @override
  Stream<Shifts> call({required String params}) {
    return _shiftsRepository.getShifts();
  }
}
