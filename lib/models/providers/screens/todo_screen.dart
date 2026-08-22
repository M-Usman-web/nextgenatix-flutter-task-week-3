import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../todo_provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  void _showTaskDialog(BuildContext context, {String? taskId, String? currentTitle}) {
    final textController = TextEditingController(text: currentTitle ?? '');
    final isEditing = taskId != null;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isEditing ? 'Edit Task' : 'Add New Task'),
        content: TextField(
          controller: textController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Enter task description...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final text = textController.text.trim();
              if (text.isNotEmpty) {
                if (isEditing) {
                  Provider.of<TodoProvider>(context, listen: false).editTask(taskId, text);
                } else {
                  Provider.of<TodoProvider>(context, listen: false).addTask(text);
                }
              }
              Navigator.pop(ctx);
            },
            child: Text(isEditing ? 'Update' : 'Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App (CRUD)'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          if (todoProvider.tasks.isEmpty) {
            return const Center(
              child: Text(
                'No tasks added yet. Tap + to add.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: todoProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = todoProvider.tasks[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) => todoProvider.toggleTaskStatus(task.id),
                  ),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 16,
                      decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                      color: task.isCompleted ? Colors.grey : Colors.black,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _showTaskDialog(context, taskId: task.id, currentTitle: task.title),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => todoProvider.deleteTask(task.id),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        onPressed: () => _showTaskDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}