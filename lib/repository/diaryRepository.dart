import 'package:yugen/models/diaryModel.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yugen/models/todoModel.dart';

abstract class DiaryRepository {
  Future<int> addTodo(DiaryModel diaryModel);

  Future<List<DiaryModel>> readModels();

  Future<bool> updateTodo(DiaryModel diaryModel);

  Future<bool> removeTodo(DiaryModel diaryModel);

  Stream<List<DiaryModel>> listenTodos();
}

class DiaryRepositoryImpl extends DiaryRepository {
  final _todos = StreamController<List<DiaryModel>>();

  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'diary.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE diary(uniqueId INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, note TEXT, listOfFiles TEXT, epochTime INTEGER, filename TEXT)",
        );
      },
      version: 1,
    );
  }

  @override
  Future<int> addTodo(DiaryModel diaryModel) async {
    final Database db = await database();
    try {
      int insertedId = await db.insert(
        'diary',
        diaryModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      refresh();
      return insertedId;
    } catch (e) {
      return -1;
    }
  }

  @override
  Future<List<DiaryModel>> readModels() async {
    try {
      final Database db = await database();
      final List<Map<String, dynamic>> maps =
          await db.query('diary', orderBy: "uniqueId DESC");
      print(maps);
      return List.generate(maps.length, (i) {
        return DiaryModel(
          epochTime: maps[i]['epochTime'],
          fileName: maps[i]['fileName'],
          uniqueId: maps[i]['uniqueId'],
          note: maps[i]['note'],
          listOfFiles: maps[i]['listOfFiles'],
          title: maps[i]['title'],
        );
      });
    } catch (e) {
      print(e);
      return List.empty();
    }
  }

  @override
  Future<bool> removeTodo(DiaryModel diaryModel) async {
    final Database db = await database();
    try {
      await db.delete(
        'diary',
        where: "uniqueId = ?",
        whereArgs: [diaryModel.uniqueId],
      );
      refresh();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateTodo(DiaryModel diaryModel) async {
    final Database db = await database();
    try {
      await db.update(
        'diary',
        diaryModel.toMap(),
        where: "uniqueId = ?",
        whereArgs: [diaryModel.uniqueId],
      );
      refresh();
      return true;
    } catch (e) {
      return false;
    }
  }

  void refresh() async {
    final fetchCurrentDiary = await readModels();
    _todos.add(fetchCurrentDiary);
  }

  @override
  Stream<List<DiaryModel>> listenTodos() => _todos.stream;
}
