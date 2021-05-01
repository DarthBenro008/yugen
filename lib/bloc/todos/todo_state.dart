part of 'todo_bloc.dart';

abstract class todoState extends Equatable {
  const todoState();
}

class todoInitial extends todoState {
  @override
  List<Object> get props => [];
}

class TodoSuccessAddResponse extends todoState {
  final int transactionId;

  TodoSuccessAddResponse(this.transactionId);

  @override
  List<Object> get props => [transactionId];
}

class TodoResponse extends todoState {
  final bool todoResponse;

  TodoResponse(this.todoResponse);

  @override
  List<Object> get props => [todoResponse];
}

class TodoError extends todoState {
  @override
  List<Object> get props => [];
}

class TodoLoading extends todoState {
  @override
  List<Object> get props => [];
}

class TodoList extends todoState {
  final List<TodoModel> todoList;

  TodoList(this.todoList);

  @override
  List<Object> get props => [todoList];
}
