import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_fire/controllers/todo_controller.dart';
import 'package:todo_app_fire/models/todo.dart';
class TodoScreen extends StatelessWidget {
   TodoScreen({Key key,this.index}) : super(key: key);
   final TodoController todoController = Get.find();
   final int index;

  @override
  Widget build(BuildContext context) {

    String text ='';
    if(this.index!=null){
      text = todoController.todos[index].text;
    }
    TextEditingController textEditingController = TextEditingController(
      text: text
    );

    if(this.index!=null){
      text = todoController.todos[index].text;
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  autocorrect: true,
                  decoration: InputDecoration(
                    helperText: 'What do you want to accomplish?',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none
                  ),
                  style: TextStyle(
                    fontSize: 25.0
                  ),
                  keyboardType: TextInputType.multiline,

                  maxLines: 999,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red
                    ),
                    onPressed: (){
                      Get.back();
                    },
                      child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green
                    ),
                    onPressed: (){
                      if(index == null){
                        todoController.todos.add(
                          Todo(text: textEditingController.text),
                        )
                        ;
                      }
                      else{
                        var editing = todoController.todos[index];
                        editing.text = textEditingController.text;
                        todoController.todos[index] = editing;
                      }

                      Get.back();
                    },
                    child: Text((index==null)? 'Add':'Edit'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
