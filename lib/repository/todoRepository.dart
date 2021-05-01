import 'package:yugen/models/todoModel.dart';

abstract class TodoRepository {
  Future<bool> addTodo(TodoModel todoModel);
  
}
