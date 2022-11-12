import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursing_home/features/tasks/data/models/task_model.dart';
import 'package:nursing_home/features/tasks/domain/entities/task.dart';
import 'package:nursing_home/features/tasks/domain/usecases/usecases.dart';
import 'package:injectable/injectable.dart';

part 'tasks_state.dart';

@injectable
class TasksCubit extends Cubit<TasksState> {
  TasksCubit(
    this._addNewTaskUseCase,
    this._getAllTasksUseCase,
    this._updateTaskUseCase,
  ) : super(const TasksInitial());

  final AddNewTaskUseCase _addNewTaskUseCase;
  final GetAllTasksUseCase _getAllTasksUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  StreamSubscription? _streamSubscription;

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    await super.close();
  }

  static TasksCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> addNewTask(TaskModel task) async {
    emit(const TasksLoading());
    await _addNewTaskUseCase(params: task).then((tsk) {
      emit(TaskSuccess(task));
    }).catchError((dynamic e) {
      emit(TasksFailed(e.toString()));
    });
  }

  Future<void> getAllTasks(String uid) async {
    _streamSubscription ??=
        _getAllTasksUseCase(params: uid).map(TasksSuccess.new).listen(emit);
  }

  Future<void> updateTask(
    String uid,
    Map<String, dynamic> updateInfo,
  ) async {
    emit(const TasksLoading());
    await _updateTaskUseCase(paramsOne: uid, paramsTwo: updateInfo).then((tsk) {
      emit(TaskMapSuccess(updateInfo));
    }).catchError((dynamic e) {
      emit(TasksFailed(e.toString()));
    });
  }
}
