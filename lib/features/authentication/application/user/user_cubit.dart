import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursing_home/features/tasks/data/models/task_model.dart';
import 'package:nursing_home/features/tasks/domain/usecases/usecases.dart';
import 'package:injectable/injectable.dart';

part 'user_state.dart';

@injectable
class TasksCubit extends Cubit<TasksState> {
  TasksCubit(
    this._getUserUseCase,
  ) : super(const TasksInitial());

  final AddNewTaskUseCase _getUserUseCase;

  static TasksCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> addNewTask(TaskModel task) async {
    emit(const TasksLoading());
    await _getUserUseCase(params: task).then((tsk) {
      emit(TaskSuccess(task));
    }).catchError((dynamic e) {
      emit(TasksFailed(e.toString()));
    });
  }
}
