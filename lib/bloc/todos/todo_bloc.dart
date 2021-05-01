import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yugen/models/todoModel.dart';
import 'package:yugen/repository/todoRepository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<todoEvent, todoState> {
  final TodoRepository todoRepository;

  TodoBloc(this.todoRepository) : super(todoInitial()) {
    todoRepository.listenTodos().listen((event) {
      add(StreamtodoEvent(event));
    });
  }

  @override
  Stream<todoState> mapEventToState(
    todoEvent event,
  ) async* {
    yield TodoLoading();
    if (event is DownloadtodoEvent) {
      try {
        var result = await todoRepository.addTodo(event.todoModel);
        yield TodoSuccessAddResponse(result);
      } catch (e) {
        yield TodoError();
      }
    } else if (event is UploadtodoEvent) {
      try {
        await todoRepository.addTodo(event.todoModel);
        yield TodoResponse(true);
      } catch (e) {
        yield TodoError();
      }
    } else if (event is DeletetodoEvent) {
      try {
        await todoRepository.removeTodo(event.todoModel);
        yield TodoResponse(true);
      } catch (e) {
        yield TodoError();
      }
    } else if (event is FetchtodosEvent) {
      final result = await todoRepository.readModels();
      print(result);
      yield TodoList(result);
    } else if (event is UpdatetodoEvent) {
      try {
        final result = await todoRepository.updateTodo(event.todoModel);
        yield TodoResponse(result);
      } catch (e) {
        yield TodoError();
      }
    } else if (event is StreamtodoEvent) {
      yield TodoList(event.todos);
    }
  }
}
