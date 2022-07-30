import 'package:flutter/material.dart';
import 'package:todo_app_fire/controllers/todo_controller.dart';

import 'package:get/get.dart';
import 'package:todo_app_fire/screens/todo_screens.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Get.to(()=>TodoScreen());
        },
      ),
      appBar: AppBar(
        title:const Text('Getx Todo List'),
      ),
      body: Container(
        child: Obx(()=>ListView.separated(
            itemBuilder: (context,index)=>Dismissible(
              key: UniqueKey(),
              onDismissed: (_){
                var removed = todoController.todos[index];
                todoController.todos.removeAt(index);
                Get.snackbar('Task removed', 'the task "${removed.text}" was successfully removed.',
                mainButton: TextButton(onPressed: (){
                  if(removed.isNull){
                    return;
                  }
                  todoController.todos.insert(index, removed);
                  removed = null;
                  if(Get.isSnackbarOpen){
                    Get.back();
                  }
                }, child: Text('undo',style: TextStyle(color: Colors.black),))
                );
              },
              child: ListTile(
                title: Text(
                  todoController.todos[index].text,
                  style: (todoController.todos[index].done)?
                  TextStyle(
                    color: Colors.red,
                       decoration: TextDecoration.lineThrough
                  ) :
                  TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                  )
                  ,
                ),
                onTap: (){
                  Get.to(()=>TodoScreen(index: index,));
                },
                leading: Checkbox(
                  onChanged: (v){
                     var changed = todoController.todos[index];
                     changed.done= v;
                    todoController.todos[index] = changed;

                  },
                  value: todoController.todos[index].done,
                ),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
            separatorBuilder:(_,__)=>Divider(),
            itemCount: todoController.todos.length)),
      ),
    );
  }
}
