import 'package:nursing_home/features/residents/domain/entities/resident.dart';

abstract class ResidentsRepository {
  Stream<List<Resident>> getResidents();
}
