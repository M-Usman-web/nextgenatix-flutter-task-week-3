# NextGenatix Flutter Internship — Week 3

## 📝 To-Do App (CRUD Operations)

A simple, clean To-Do application built with Flutter as part of the Week 3 internship task. The app demonstrates full CRUD functionality along with state management using the **Provider** package.

---

## ✨ Features

- **Add Task** — Create a new task via a dialog box
- **Edit Task** — Update an existing task's title
- **Delete Task** — Remove a task from the list
- **Mark as Completed** — Toggle a task's completion status with a checkbox (shows strikethrough text when done)
- **Dynamic List Rendering** — Tasks are displayed using `ListView.builder`
- **Empty State** — Friendly message shown when no tasks exist yet

---

## 🛠️ Tech Stack

- **Flutter** (Dart)
- **Provider** — for state management (`ChangeNotifier` + `Consumer`)

---

## 📂 Project Structure

```
lib/
 ├── main.dart                  # App entry point, Provider setup
 ├── task_model.dart            # Task data model
 └── providers/
      ├── todo_provider.dart    # CRUD logic + state management
      └── screens/
           └── todo_screen.dart # Main UI screen
```

---

## 🔄 State Management Journey

The app initially used `setState()` for local UI updates and was later refactored to use the **Provider** package (`ChangeNotifier`) for scalable, app-wide state management.

---

## 🚀 Getting Started

1. Clone the repository
   ```bash
   git clone https://github.com/M-Usman-web/nextgenatix-flutter-task-week-3.git
   ```
2. Get dependencies
   ```bash
   flutter pub get
   ```
3. Run the app
   ```bash
   flutter run
   ```

---


## 👤 Author

**Muhammad Usman**
Flutter Development Intern — NextGenatix
