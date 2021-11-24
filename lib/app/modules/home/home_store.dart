import 'package:firebase_list/app/modules/home/models/todo_model.dart';
import 'package:firebase_list/app/modules/home/repositories/todo_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  
 late final ITodoRepository repository;

  @observable
  late ObservableStream<List<TodoModel>> tolist;
  int counter = 0;
  
  HomeStoreBase(ITodoRepository this.repository){
    getList();
  }
   

  @action
  getList(){
    tolist= repository.getTodos().asObservable();
  }  
}
   
  
  
