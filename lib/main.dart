import 'package:flutter/material.dart';
import 'package:simple_todo_app/models/todo_manager.dart';
import 'package:simple_todo_app/widgets/popup_form.dart';

import 'models/todo_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Folio3 Internship, Week 5',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Simple Todo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TodoManager myTodoManager = new TodoManager();

  void _addTodo(Todo todo) {
    setState(() {
      myTodoManager.addTodoTask(todo);
    });
  }

  void _toggleStatus(int index) {
    setState(() {
      myTodoManager.markStatus(index: index);
    });
  }

  void _removeTodo(int index) {
    setState(() {
      myTodoManager.removeTodoTask(id: myTodoManager.todoTasks[index].id);
    });
  }

  Icon _getCheckboxIcon(int index) {
    return myTodoManager.todoTasks[index].status
        ? Icon(
            Icons.check_box_outlined,
            size: 20.0,
            color: Colors.green[400],
          )
        : Icon(
            Icons.check_box_outline_blank,
            size: 20.0,
            color: Colors.green[400],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: myTodoManager.todoTasks.length,
            itemBuilder: (context, index) {
              return Card(
                key: UniqueKey(),
                child: ListTile(
                  title: Text(
                    myTodoManager.todoTasks[index].title,
                    style: myTodoManager.todoTasks[index].status
                        ? TextStyle(decoration: TextDecoration.lineThrough)
                        : TextStyle(decoration: TextDecoration.none),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: _getCheckboxIcon(index),
                        onPressed: () {
                          _toggleStatus(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          size: 20.0,
                          color: Colors.green[400],
                        ),
                        onPressed: () {
                          _removeTodo(index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
        floatingActionButton: PopupForm(callback: _addTodo));
  }
}
