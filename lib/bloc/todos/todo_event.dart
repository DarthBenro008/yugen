part of 'todo_bloc.dart';

abstract class todoEvent extends Equatable {
  const todoEvent();
}

class DownloadtodoEvent extends todoEvent {
  final TodoModel todoModel;
  final String downloadUrl;
  final String storeLogoUrl;
  final String storeId;

  DownloadtodoEvent(
      this.todoModel, this.downloadUrl, this.storeLogoUrl, this.storeId);

  @override
  List<Object> get props => [todoModel, downloadUrl, storeLogoUrl, storeId];
}

class UploadtodoEvent extends todoEvent {
  final TodoModel todoModel;
  final File file;

  UploadtodoEvent(this.todoModel, this.file);

  @override
  List<Object> get props => [];
}

class DeletetodoEvent extends todoEvent {
  final TodoModel todoModel;

  DeletetodoEvent(this.todoModel);

  @override
  List<Object> get props => [todoModel];
}

class FetchtodosEvent extends todoEvent {
  final int fromEpoch;
  final int toEpoch;

  FetchtodosEvent(this.fromEpoch, this.toEpoch);

  @override
  List<Object> get props => [];
}

class UpdatetodoEvent extends todoEvent {
  final TodoModel todoModel;

  UpdatetodoEvent(this.todoModel);

  @override
  List<Object> get props => [todoModel];
}

class StreamtodoEvent extends todoEvent {
  final List<TodoModel> todos;

  StreamtodoEvent(this.todos);

  @override
  List<Object> get props => [todos];
}
