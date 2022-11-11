import 'package:nursing_home/features/residents/domain/repositories/residents_repository.dart';
import 'package:nursing_home/features/residents/data/models/resident_model.dart';
import 'package:nursing_home/features/residents/data/remote_sources/firestore_remote_residents.dart';
import 'package:nursing_home/features/residents/domain/entities/resident.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ResidentsRepository)
class ResidentsRepositoryImpl implements ResidentsRepository {
  @override
  Stream<List<Resident>> getResidents() {
    try {
      return FireStoreRemoteResidents.getResidents()
          .map((residents) => residents.toEntities());
    } catch (e) {
      return Stream.error(e.toString());
    }
  }
}
