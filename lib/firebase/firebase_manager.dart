import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/task_model.dart';

class FirebaseManager {

  static CollectionReference<TaskModel> getTasksCollection(){
    return FirebaseFirestore.instance.collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      } ,
      toFirestore: (value, options) {
        return value.toJson();
      } ,
    );
  }

  static Future<void> addEvent(TaskModel taskModel) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    taskModel.id = docRef.id;
    return docRef.set(taskModel);
  }
  static Stream<QuerySnapshot<TaskModel>> getEvents() {
    var collection = getTasksCollection();
    return collection.orderBy('date').snapshots();
  }
  static Future<void> deleteTask(String id){
    var collection = getTasksCollection();
    return collection.doc(id).delete();
  }
  static Future<void> updateTask(TaskModel taskModel){
    var collection = getTasksCollection();
    return collection.doc(taskModel.id).update(taskModel.toJson());
  }
}