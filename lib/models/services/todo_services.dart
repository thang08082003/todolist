import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/models/todo_model.dart';

class TodoServices {
  final todoCollection = FirebaseFirestore.instance.collection('todolist');
  void addNewTask(TodoModel model) {
    todoCollection.add(model.toMap());
  }

  void updateTask(String? docID, bool? valueUpdate) {
    todoCollection.doc(docID).update({
      'isDone': valueUpdate,
    });
  }

  void deleteTask(String? docID) {
    todoCollection.doc(docID).delete();
  }
}
