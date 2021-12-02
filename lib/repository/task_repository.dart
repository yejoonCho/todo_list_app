import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list_app/model/task.dart';

class TaskRepository {
  Future<List<Task>> fetch() {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('tasks');
    return collection.get().then((snapshot) =>
        snapshot.docs.map((doc) => Task.fromDocument(doc)).toList());
  }
}
