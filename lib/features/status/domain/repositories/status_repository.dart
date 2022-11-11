import 'package:nursing_home/features/status/domain/entities/status.dart';

abstract class StatusRepository {
  Stream<List<Status>> getStatus();
}
