import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  static CollectionReference<UserModel> getUserCollection(){
    return FirebaseFirestore.instance.collection("User")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
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
  static Future<void> addUser(UserModel userModel){
    var collection = getUserCollection();
    var docRef = collection.doc(userModel.id);
    return docRef.set(userModel);
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

  static void createUser({
    required String name,
    required String email,
    required String password,
    required Function onSuccess,
    required Function(String errorMessage) onError,
    required Function onLoading,
  }) async{
    try {
      onLoading();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel(
        id: credential.user!.uid,
        email: email,
        name: name,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
        await addUser(userModel);
        onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        onError(e.message!);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        onError(e.message!);
      }
    } catch (e) {
      print(e);
      onError("Something Went Wrong");
    }
  }
  static void loginUser({
    required String email,
    required String password,
    required Function onSuccess,
    required Function(String errorMessage) onError,
    required Function onLoading,
  }) async{
    try {
      onLoading();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError("Email Or Password Is Not Valid");
    }
  }
}