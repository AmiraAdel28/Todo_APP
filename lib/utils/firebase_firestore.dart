import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';

class dataBase{

 static CollectionReference<TaskModel> getDataFromFirebase(){
    return FirebaseFirestore.instance.collection('tasks').
    withConverter<TaskModel>
      (fromFirestore: (docSnapShot,_){
      return TaskModel.fromJason(docSnapShot.data()!);
    },
        toFirestore: (task,_)=>task.toJason());
  }
  static Future AddTaskToFirestore(TaskModel task) async {

    var collection= await getDataFromFirebase();
    var doc=collection.doc();
    task.id=doc.id;
    return doc.set(task);

  }
 static Future<void> deleteFromFireBase(TaskModel task) async {
    var collection = getDataFromFirebase();
    return collection.doc(task.id).delete();
  }
 static Future <void>updateFromFireBase(TaskModel task) async {
    var collection = getDataFromFirebase();
    return await collection.doc(task.id).update({
      'title':task.title,
      'description':task.description,
      'selectedDate': task.selectedDate,
    });
  }
 static Future<QuerySnapshot<TaskModel>> GetTasksFromFireStore(DateTime time) async {
    var collection =await getDataFromFirebase();
    return collection.where('selectedDate',isEqualTo:DateUtils.dateOnly(time).microsecondsSinceEpoch).get();
  }
 static Stream<QuerySnapshot<TaskModel>> GetTasksFromFireStoreusingStream(DateTime time) {
    var collection = getDataFromFirebase();
    return collection.where('selectedDate',isEqualTo:DateUtils.dateOnly(time).microsecondsSinceEpoch).snapshots();
  }

}
