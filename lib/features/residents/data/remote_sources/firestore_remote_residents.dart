import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nursing_home/features/residents/data/models/resident_model.dart';

class FireStoreRemoteResidents {
  static final _firestore = FirebaseFirestore.instance;

  static Stream<List<ResidentModel>> getResidents() {
    return _firestore
        .collection('residents')
        .snapshots(includeMetadataChanges: true)
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            return ResidentModel.fromJsonAndString(doc.data(), doc.id);
          }).toList(),
        );
  }
}
