import 'package:flutter/material.dart';
import 'package:simple_todo_app/models/todo_model.dart';

class PopupForm extends StatefulWidget {
  // TodoManager todoManager;
  Function callback;
  PopupForm({Key? key, required this.callback}) : super(key: key);

  @override
  _PopupFormState createState() => _PopupFormState();
}

class _PopupFormState extends State<PopupForm> {
  var titleController = new TextEditingController();
  var descriptionController = new TextEditingController();

  void _addTodo() {
    var task = Todo(
        title: titleController.text,
        description: descriptionController.text,
        status: false);

    setState(() {
      titleController.clear();
      descriptionController.clear();
    });
    widget.callback(task);
    Navigator.pop(context);
  }

  Widget _openDialog() {
    return AlertDialog(
      scrollable: true,
      title: Text('Add Task'),
      content: Center(
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Title',
                  icon: Icon(Icons.task),
                ),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(hintText: 'Description'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            _addTodo();
          },
          child: Text('Add'),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(context: context, builder: (_) => _openDialog());
      },
      tooltip: 'Add Task',
      child: Icon(Icons.add),
    );
  }
}
