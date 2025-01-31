# task_management_app

## overview
this is a simple **task management app** built with **flutter** and **riverpod** for state management. it allows users to add, edit, delete, and mark tasks as completed. the app uses **sqlite** for task storage and **hive** for storing user preferences (e.g., theme settings).

## features
- **task management**: add, edit, delete, and mark tasks as completed.
- **persistent storage**: stores tasks using sqlite and user preferences with hive.
- **state management**: uses riverpod for efficient state handling.
- **mvvm architecture**: ensures separation of concerns between ui and logic.
- **light/dark mode support**: saves user theme preference using hive.

## installation

### prerequisites
- install **flutter**: [flutter installation guide](https://flutter.dev/docs/get-started/install)
- install **dart**
- set up an **android emulator** or **physical device**

### clone the repository
```sh
git clone https://github.com/your-repo/task-management-app.git
cd task-management-app
```

### install dependencies
```sh
flutter pub get
```

### run the app
```sh
flutter run
```

## dependencies used
- **flutter_riverpod**: state management
- **hive_flutter**: lightweight database for storing preferences
- **sqflite**: sqlite database for storing tasks
- **path_provider**: provides access to local storage paths

## folder structure
```
lib/
|-- models/        # data models
|-- views/         # ui components
|-- viewmodels/    # business logic
|-- database/      # sqlite database handling
|-- main.dart      # app entry point
```

## contributing
feel free to fork this repository, make changes, and submit a pull request!

## license
this project is licensed under the **mit license**.

## contact
for any questions, reach out at **sanwarjayswal@gmail.com**

