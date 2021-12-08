import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list_app/model/task.dart';

class TaskRepository {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('tasks');

  Future<List<Task>> fetchData() {
    return collection.get().then((snapshot) =>
        snapshot.docs.map((doc) => Task.fromDocument(doc)).toList());
  }

  Future<void> addData(Task task) async {
    await collection.add(task.toMap());
  }

  Future<void> updateData(Task oldTask, Task newTask) async {
    await collection.doc(oldTask.id).update(newTask.toMap());
  }
}
