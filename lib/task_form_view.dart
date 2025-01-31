import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/task_model.dart';
import 'package:task_management_app/task_view_model.dart';

class TaskFormView extends ConsumerWidget {
  final Task? task;
  TaskFormView({this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController(text: task?.title ?? '');
    final descriptionController =
        TextEditingController(text: task?.description ?? '');

    return Scaffold(
      appBar: AppBar(title: Text(task == null ? 'Add Task' : 'Edit Task')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title')),
            TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newTask = Task(
                  id: task?.id ?? DateTime.now().millisecondsSinceEpoch,
                  title: titleController.text,
                  description: descriptionController.text,
                  isCompleted: task?.isCompleted ?? false,
                );
                ref.read(taskListProvider.notifier).addTask(newTask);
                Navigator.pop(context);
              },
              child: Text(task == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
