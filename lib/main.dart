import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_management_app/task_list_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  runApp(ProviderScope(child: TaskManagementApp()));
}

class TaskManagementApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeBox = Hive.box('settings');
    final isDarkMode = themeBox.get('isDarkMode', defaultValue: false);

    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: TaskListView(),
    );
  }
}
