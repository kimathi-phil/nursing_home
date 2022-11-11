import 'package:nursing_home/features/shifts/domain/entities/shift.dart';

abstract class ShiftsRepository {
  Stream<List<Shift>> getShifts();
}
