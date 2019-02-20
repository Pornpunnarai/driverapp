import 'package:firebase_database/firebase_database.dart';

class Todo {
  String key;
  String subject;
  bool completed;
  String userId;
  String test;

  Todo(this.subject, this.userId, this.completed, this.test);

  Todo.fromSnapshot(DataSnapshot snapshot) :
    key = snapshot.key,
    userId = snapshot.value["userId"],
    subject = snapshot.value["subject"],
    completed = snapshot.value["completed"],
    test = snapshot.value["test"];

  toJson() {
    return {
      "userId": userId,
      "subject": subject,
      "completed": completed,
      "test": test
    };
  }
}