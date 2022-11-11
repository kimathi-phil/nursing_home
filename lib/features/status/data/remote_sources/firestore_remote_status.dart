import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nursing_home/features/status/data/models/status_model.dart';

class FireStoreRemoteStatus {
  static final _firestore = FirebaseFirestore.instance;

  static Stream<List<StatusModel>> getStatus() {
    return _firestore
        .collection('status')
        .snapshots(includeMetadataChanges: true)
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            return StatusModel.fromJsonAndString(doc.data(), doc.id);
          }).toList(),
        );
  }
}
