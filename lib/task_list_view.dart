import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/task_form_view.dart';
import 'package:task_management_app/task_view_model.dart';

class TaskListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskFormView()),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          final task = taskList[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: Checkbox(
              value: task.isCompleted,
              onChanged: (value) {
                ref.read(taskListProvider.notifier).toggleTaskStatus(task);
              },
            ),
            onLongPress: () {
              if (task.id != null) {
                ref.read(taskListProvider.notifier).deleteTask(task.id!);
              }
            },
          );
        },
      ),
    );
  }
}
