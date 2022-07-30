

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_fire/models/todo.dart';

class TodoController extends GetxController{
  RxList<Todo> todos = <Todo>[].obs;
  @override
  void onInit() {
    List storageTodos = GetStorage().read<List>('todos');
    if(!storageTodos.isNull){
      todos = storageTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todos,(_){
      GetStorage().write('todos',todos.toList());
    });
    super.onInit();
  }
}