import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  bool isDone;
  @HiveField(4)
  bool isArchived;
  @HiveField(5)
  bool isPressed;
  @HiveField(6)
  int? color;

  TaskModel(
      {required this.title,
      required this.description,
      required this.date,
      this.color,
      this.isDone = false,
      this.isArchived = false,
      this.isPressed = false});

  // factory TaskModel.fromJson(Map<String, dynamic> json) {
  //   return TaskModel(
  //     title: json["title"] ?? '',
  //     description: json["description"] ?? '',
  //     date: DateTime.fromMillisecondsSinceEpoch(json["date"]),
  //     isDone: json["isDone"] ?? false,
  //     isArchived: json["isAchieved"] ?? false,
  //   );
  // }
}
