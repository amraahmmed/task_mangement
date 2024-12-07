import 'package:hive/hive.dart';


part 'tasks.g.dart';
@HiveType(typeId: 0)

class TaskModel extends HiveObject  {
  @HiveField(0)
  String name;
  
  @HiveField(1)
  bool isCompleted;




  TaskModel({
    required this.name,
    this.isCompleted = false
   
  });
}