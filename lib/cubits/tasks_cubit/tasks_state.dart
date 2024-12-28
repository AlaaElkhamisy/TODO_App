part of 'tasks_cubit.dart';

@immutable
sealed class TasksState {}

class TasksInitial extends TasksState {}

class TasksSuccess extends TasksState {}
