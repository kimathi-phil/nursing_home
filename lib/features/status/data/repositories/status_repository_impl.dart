import 'package:nursing_home/features/status/domain/repositories/status_repository.dart';
import 'package:nursing_home/features/status/data/models/status_model.dart';
import 'package:nursing_home/features/status/data/remote_sources/firestore_remote_status.dart';
import 'package:nursing_home/features/status/domain/entities/status.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: StatusRepository)
class StatusRepositoryImpl implements StatusRepository {
  @override
  Stream<List<Status>> getStatus() {
    try {
      return FireStoreRemoteStatus.getStatus()
          .map((status) => status.toEntities());
    } catch (e) {
      return Stream.error(e.toString());
    }
  }
}
