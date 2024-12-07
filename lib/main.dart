import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_mangement/app/models/tasks.dart';
import 'package:task_mangement/app/screens/tasks_screen.dart';
import 'package:task_mangement/app/screens/welcome_screen.dart';
void main() async {
  await Hive.initFlutter();  // Make sure to initialize Hive before using it
  
  Hive.registerAdapter(TaskModelAdapter());  // Register the generated adapter
  
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TASKIFY',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home:  WelcomeScreen(),
    );
  }
}