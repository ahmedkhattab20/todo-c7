import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_v1/database/task.dart';

class MyDatabase{
  static CollectionReference<Task> getTasksCollection(){
    var tasksCollection =FirebaseFirestore.instance.collection('tasks').withConverter(
      fromFirestore: ((snapshot, options) => Task.fromFirreStore(snapshot.data()!)),
      toFirestore: (task,options)=>task.toFireStore());
    return tasksCollection;
  }
  static  Future<void> insertTask(Task task){
var tasksCollection=getTasksCollection();
var doc= tasksCollection.doc();
task.id = doc.id;
return doc.set(task);
  }
}
