import 'package:firebase_list/app/modules/home/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_store.dart';


class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Observer(builder:(_){
 
        if (controller.tolist.hasError) {
          return Center(
            child: RaisedButton(
              onPressed:controller.getList(), 
            child: Text('erro'),),
          );
        }

        if (controller.tolist.data == null){
           return Center(
             child: CircularProgressIndicator(),
           );
        }

        List<TodoModel> list = controller.tolist.data;

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index){
            TodoModel model = list[index];
           return CheckboxListTile(
          title: Text(model.title),
          value: model.check, 
           onChanged: (check){
             model.check = check!;
             model.save();
           });
        },
        );
      },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog(),
        child: Icon(Icons.add),
      ),
    );
  }

  _showDialog(TodoModel model){
    
     showDialog(
     context: context, 
     builder: (_){
        return AlertDialog(
          title: Text('adicionar novo'),
          content: TextField(
            onChanged: (value)=> model.title = value,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'escreva',
            ),
          ),
          actions: <Widget>[
            FlatButton(onPressed: (){
                  Modular.to.pop();
            }, 
             child:Text('cancelar')
            ),
             FlatButton(onPressed: () async{
                 model.save();
                 Modular.to.pop();
             }, 
               child: Text('Adicionar')
             ),
          ],
        );
     }
     );
  }


}