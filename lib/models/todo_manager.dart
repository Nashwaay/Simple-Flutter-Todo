import 'package:simple_todo_app/models/todo_model.dart';

class TodoManager {
  List<Todo> todoTasks = [];

  TodoManager();

  void addTodoTask(Todo task) {
    todoTasks.add(task);
  }

  void removeTodoTask({id: String}) {
    todoTasks.removeWhere((element) => element.id == id);
  }

  void markAsComplete({id: String}) {
    todoTasks.firstWhere((element) => element.id == id).status = true;
  }

  void markAsIncomplete({id: String}) {
    todoTasks.firstWhere((element) => element.id == id).status = false;
  }

  void markStatus({index: int}) {
    todoTasks[index].status = !todoTasks[index].status;
  }
}
