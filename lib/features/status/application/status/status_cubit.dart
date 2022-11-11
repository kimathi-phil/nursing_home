import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursing_home/features/status/data/models/status_model.dart';
import 'package:nursing_home/features/status/domain/entities/status.dart';
import 'package:nursing_home/features/status/domain/usecases/usecases.dart';
import 'package:injectable/injectable.dart';

part 'status_state.dart';

@injectable
class StatusCubit extends Cubit<StatusState> {
  StatusCubit(
    this._getAllStatusUseCase,
  ) : super(const StatusInitial());

  final GetAllStatusUseCase _getAllStatusUseCase;
  StreamSubscription? _streamSubscription;

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    await super.close();
  }

  static StatusCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getAllStatus() async {
    _streamSubscription ??=
        _getAllStatusUseCase(params: '').map(StatusesSuccess.new).listen(emit);
  }
}
