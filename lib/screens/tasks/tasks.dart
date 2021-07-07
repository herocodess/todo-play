import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:todo_play/models/todoList.dart';
import 'package:todo_play/screens/completed_tasks/completed_tasks.dart';
import 'package:todo_play/screens/tasks/todolist.dart';

class Tasks extends StatelessWidget {
  // display completed tasks screen
  void _goToCompletedTasks(context, todoList) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CompletedTasks(todoList: todoList)));
  }

  @override
  Widget build(BuildContext context) {
    // get tasks from shared preferences
    final TodoListModel todoList = TodoListModel();
    // getTasksFromSharedPrefs call notifyListeners
    todoList.getTasksFromSharedPrefs();

    return Scaffold(
        appBar: AppBar(
          title: Text('TodoList'),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () => _goToCompletedTasks(context, todoList)))
          ],
        ),
        body: ChangeNotifierProvider.value(
          value: todoList,
          child: TodoListWidget(),
        ));
  }
}
