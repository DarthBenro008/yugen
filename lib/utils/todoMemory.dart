import 'package:yugen/bloc/todos/todo_bloc.dart';
import 'package:yugen/models/todoModel.dart';

class TodoMemory {
  late List<TodoModel> todoList;
  double ggScore = 0;
  int totalTaskCompleted = 230;

  void add(TodoModel todoModel) {
    todoList.add(todoModel);
  }

  void updateCompleted(TodoModel todoModel) {
    todoList[todoList
            .indexWhere((element) => element.uniqueId == todoModel.uniqueId)]
        .isCompleted = !todoList[todoList
            .indexWhere((element) => element.uniqueId == todoModel.uniqueId)]
        .isCompleted;
    TodoModel todoModel2 = todoList.removeAt(todoList
        .indexWhere((element) => element.uniqueId == todoModel.uniqueId));
    todoList.insert(todoList.length, todoModel2);
    updateGgScore();
    updateTotalCompleted();
  }

  void updateGgScore() {
    int completed = 0;
    todoList.forEach((element) {
      if (element.isCompleted) {
        completed++;
      }
    });
    ggScore = (completed / todoList.length) * 100;
  }

  void updateTotalCompleted() {
    totalTaskCompleted = 230;
    todoList.forEach((element) {
      if (element.isCompleted) {
        totalTaskCompleted++;
      }
    });
  }

  TodoMemory() {
    todoList = [
      TodoModel(
          uniqueId: 1,
          taskName: "Random Task",
          note: "Complete this work",
          deadlineTaskTime: 121,
          epochTime: 1213,
          isCompleted: false,
          filename: "filename"),
      TodoModel(
          uniqueId: 2,
          taskName: "Random Task 2",
          note: "Complete this work",
          deadlineTaskTime: 121,
          epochTime: 1213,
          isCompleted: false,
          filename: "filename"),
      TodoModel(
          uniqueId: 3,
          taskName: "Random Task 3",
          note: "Complete this work",
          deadlineTaskTime: 121,
          epochTime: 1213,
          isCompleted: false,
          filename: "filename"),
      TodoModel(
          uniqueId: 4,
          taskName: "Random Task 4",
          note: "Complete this work",
          deadlineTaskTime: 121,
          epochTime: 1213,
          isCompleted: false,
          filename: "filename"),
    ];
  }
}
