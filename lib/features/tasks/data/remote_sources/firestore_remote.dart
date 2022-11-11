import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nursing_home/features/tasks/data/models/task_model.dart';

class FireStoreRemote {
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> addTask({required TaskModel task}) async {
    var taskCollection = _firestore.collection('tasks');
    await taskCollection.add(task.toFirestoreJson());
  }

  static Stream<List<TaskModel>> getTasks({required String uid}) {
    return _firestore
        .collection('tasks')
        // .orderBy('shift', descending: true)
        .where('nurse', isEqualTo: uid)
        .snapshots(includeMetadataChanges: true)
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            return TaskModel.fromJsonAndString(doc.data(), doc.id);
          }).toList(),
        );
  }
}
