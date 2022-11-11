import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nursing_home/features/shifts/data/models/shift_model.dart';

class FireStoreRemoteShifts {
  static final _firestore = FirebaseFirestore.instance;

  static Stream<List<ShiftModel>> getShifts() {
    return _firestore
        .collection('shifts')
        .snapshots(includeMetadataChanges: true)
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            return ShiftModel.fromJsonAndString(doc.data(), doc.id);
          }).toList(),
        );
  }
}
