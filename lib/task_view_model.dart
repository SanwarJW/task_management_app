import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/task_database.dart';
import 'package:task_management_app/task_model.dart';

class TaskViewModel extends StateNotifier<List<Task>> {
  final TaskDatabase _taskDatabase = TaskDatabase();

  TaskViewModel() : super([]) {
    loadTasks();
  }

  Future<void> loadTasks({String searchQuery = '', bool? completed}) async {
    List<Task> tasks = await _taskDatabase.getTasks();
    if (searchQuery.isNotEmpty) {
      tasks = tasks
          .where((task) =>
              task.title.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
    if (completed != null) {
      tasks = tasks.where((task) => task.isCompleted == completed).toList();
    }
    state = tasks;
  }

  Future<void> addTask(Task task) async {
    await _taskDatabase.insertTask(task);
    loadTasks();
  }

  Future<void> toggleTaskStatus(Task task) async {
    final updatedTask = Task(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: !task.isCompleted,
    );
    await _taskDatabase.updateTask(updatedTask);
    loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await _taskDatabase.deleteTask(id);
    loadTasks();
  }
}

final taskListProvider =
    StateNotifierProvider<TaskViewModel, List<Task>>((ref) => TaskViewModel());
