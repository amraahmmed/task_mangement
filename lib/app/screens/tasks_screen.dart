import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_mangement/app/models/tasks.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late Box<TaskModel> taskBox;
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _updateController = TextEditingController();
  bool _isBoxReady = false;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    try {
      taskBox = await Hive.openBox<TaskModel>('tasks');
      setState(() {
        _isBoxReady = true;
      });
    } catch (e) {
      debugPrint('Error opening Hive box: $e');
      setState(() {
        _isBoxReady = false;
      });
    }
  }

  // create

  void _addTask(String taskName) {
    if (taskName.isNotEmpty) {
      final task = TaskModel(name: taskName, isCompleted: false);
      taskBox.add(task); // Save task to the database
      _taskController.clear();
      setState(() {});
    }
  }

  //update

  void _updateTaskName(int index, String newName) {
    if (newName.isNotEmpty) {
      final task = taskBox.getAt(index);
      if (task != null) {
        task.name = newName;
        taskBox.putAt(index, task); // Update the task in the database
        _updateController.clear();
        setState(() {});
      }
    }
  }
//delete all
  void _deleteAllTasks() async {
    await taskBox.clear(); // Clear the entire database
    setState(() {});
  }

  @override
  void dispose() {
    _taskController.dispose();
    _updateController.dispose();
    taskBox.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YOUR TASKS',
          style: TextStyle(color: Colors.deepOrange),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      labelText: 'Add a task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.deepOrange),
                  onPressed: () {
                    _addTask(_taskController.text);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: !_isBoxReady
                ? const Center(child: CircularProgressIndicator())
                : ValueListenableBuilder(
                    valueListenable: taskBox.listenable(),
                    builder: (context, Box<TaskModel> box, _) {
                      if (box.isEmpty) {
                        return const Center(
                          child: Text(
                            'No tasks yet!',
                            style: TextStyle(
                                color: Colors.deepOrange, fontSize: 18),
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: box.length,
                        itemBuilder: (context, index) {
                          final task = box.getAt(index);
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            color: task?.isCompleted ?? false
                                ? Colors.deepOrange.shade100
                                : Colors.white,
                            child: ListTile(
                              leading: Checkbox(
                                value: task?.isCompleted ?? false,
                                onChanged: (bool? value) {
                                  if (task != null) {
                                    setState(() {
                                      task.isCompleted = value ?? false;
                                      box.putAt(index, task); // Update in database
                                    });
                                  }
                                },
                                activeColor: Colors.deepOrange,
                              ),
                              title: Text(
                                task?.name ?? '',
                                style: TextStyle(
                                  decoration: task?.isCompleted ?? false
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  color: task?.isCompleted ?? false
                                      ? Colors.grey
                                      : Colors.black,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blue),
                                    onPressed: () {
                                      _updateController.text =
                                          task?.name ?? ''; // Pre-fill the controller
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Update Task'),
                                            content: TextField(
                                              controller: _updateController,
                                              decoration: const InputDecoration(
                                                labelText: 'Task Name',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  _updateTaskName(index,
                                                      _updateController.text);
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Update'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      box.deleteAt(index); // Remove from database
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _deleteAllTasks,
        backgroundColor: Colors.deepOrange,
        tooltip: 'Delete All Tasks',
        child: const Icon(Icons.delete_forever),
      ),
    );
  }
}
