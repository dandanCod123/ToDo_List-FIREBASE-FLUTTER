import 'package:firebase_list/app/modules/home/models/todo_model.dart';

abstract class ITodoRepository {
  
  Stream<List<TodoModel>> getTodos();


}