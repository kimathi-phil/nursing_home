part of 'user_cubit.dart';

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

class TaskSuccess extends TasksState {
  const TaskSuccess(this.task);
  final TaskModel task;

  @override
  List<Object?> get props => [task];
}

class TasksFailed extends TasksState {
  const TasksFailed(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
