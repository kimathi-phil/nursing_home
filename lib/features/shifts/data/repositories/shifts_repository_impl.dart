import 'package:nursing_home/features/shifts/domain/repositories/shifts_repository.dart';
import 'package:nursing_home/features/shifts/data/models/shift_model.dart';
import 'package:nursing_home/features/shifts/data/remote_sources/firestore_remote_shifts.dart';
import 'package:nursing_home/features/shifts/domain/entities/shift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ShiftsRepository)
class ShiftsRepositoryImpl implements ShiftsRepository {
  @override
  Stream<List<Shift>> getShifts() {
    try {
      return FireStoreRemoteShifts.getShifts()
          .map((shifts) => shifts.toEntities());
    } catch (e) {
      return Stream.error(e.toString());
    }
  }
}
