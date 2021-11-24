import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_list/app/modules/home/models/todo_model.dart';
import 'package:firebase_list/app/modules/home/repositories/todo_repository_interface.dart';
import 'package:firebase_core/firebase_core.dart';
class TodoRepository implements ITodoRepository{
 
  final  FirebaseFirestore firestore;
  TodoRepository(this.firestore);

 

  @override
  Stream<List<TodoModel>> getTodos() {
    return firestore.collection('ToDoList').orderBy('position').snapshots().map(
      (query) =>query.docs.map(
        (doc) => TodoModel.fromDocument(doc)).toList());
     
    }
     
    
    }
  
