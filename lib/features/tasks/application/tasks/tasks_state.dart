part of 'tasks_cubit.dart';

abstract class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object?> get props => [];
}

class TasksInitial extends TasksState {
  const TasksInitial();
}

class TasksLoading extends TasksState {
  const TasksLoading();
}

class TasksSuccess extends TasksState {
  const TasksSuccess(this.tasks);
  final Tasks tasks;

  @override
  List<Object?> get props => [tasks];
}

class TaskSuccess extends TasksState {
  const TaskSuccess(this.task);
  final TaskModel task;

  @override
  List<Object?> get props => [task];
}

class TaskMapSuccess extends TasksState {
  const TaskMapSuccess(this.updateInfo);
  final Map<String, dynamic> updateInfo;

  @override
  List<Object?> get props => [updateInfo];
}

class TasksFailed extends TasksState {
  const TasksFailed(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
