import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yugen/models/todoModel.dart';

abstract class TodoRepository {
  Future<int> addTodo(TodoModel todoModel);

  Future<List<TodoModel>> readModels();

  Future<bool> updateTodo(TodoModel todoModel);

  Future<bool> removeTodo(TodoModel todoModel);

  Stream<List<TodoModel>> listenTodos();
}

class TodoRepositoryImpl extends TodoRepository {
  final _todos = StreamController<List<TodoModel>>();

  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todos.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE todos(uniqueId INTEGER PRIMARY KEY AUTOINCREMENT, taskName TEXT, note TEXT, deadlineTaskTime TEXT, epochTime INTEGER, isCompleted INTEGER, filename TEXT)",
        );
      },
      version: 1,
    );
  }

  @override
  Future<int> addTodo(TodoModel todoModel) async {
    final Database db = await database();
    try {
      int insertedId = await db.insert(
        'todos',
        todoModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      refresh();
      return insertedId;
    } catch (e) {
      return -1;
    }
  }

  @override
  Future<List<TodoModel>> readModels() async {
    try {
      final Database db = await database();
      final List<Map<String, dynamic>> maps =
          await db.query('todos', orderBy: "uniqueId DESC");
      print(maps);
      return List.generate(maps.length, (i) {
        return TodoModel(
          epochTime: maps[i]['epochTime'],
          filename: maps[i]['filename'],
          uniqueId: maps[i]['uniqueId'],
          note: maps[i]['note'],
          deadlineTaskTime: maps[i]['deadlineTaskTime'],
          isCompleted: maps[i]['isCompleted'],
          taskName: maps[i]['taskName'],
        );
      });
    } catch (e) {
      print(e);
      return List.empty();
    }
  }

  @override
  Future<bool> removeTodo(TodoModel todoModel) async {
    final Database db = await database();
    try {
      await db.delete(
        'todos',
        where: "uniqueId = ?",
        whereArgs: [todoModel.uniqueId],
      );
      refresh();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateTodo(TodoModel todoModel) async {
    final Database db = await database();
    try {
      await db.update(
        'todos',
        todoModel.toMap(),
        where: "uniqueId = ?",
        whereArgs: [todoModel.uniqueId],
      );
      refresh();
      return true;
    } catch (e) {
      return false;
    }
  }

  void refresh() async {
    final fetchCurrenttodos = await readModels();
    _todos.add(fetchCurrenttodos);
  }

  @override
  Stream<List<TodoModel>> listenTodos() => _todos.stream;
}
