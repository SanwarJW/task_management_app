import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_management_app/task_model.dart';

class TaskDatabase {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            isCompleted INTEGER
          )
        ''');
      },
    );
  }

  Future<void> insertTask(Task task) async {
    final db = await database;
    await db.insert('tasks', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) => Task.fromMap(maps[i]));
  }

  Future<void> updateTask(Task task) async {
    final db = await database;
    await db
        .update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
