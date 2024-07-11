import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todolist/models/services/todo_services.dart';
import 'package:todolist/models/todo_model.dart';

final serviceProvider = Provider<TodoServices>((ref) {
  return TodoServices();
});

final fetchStreamProvider = StreamProvider<List<TodoModel>>((ref) {
  return FirebaseFirestore.instance.collection('todolist').snapshots().map(
      (querySnapshot) => querySnapshot.docs
          .map((doc) => TodoModel.fromSnapshot(doc))
          .toList());
});
