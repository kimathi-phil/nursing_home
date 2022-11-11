import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursing_home/features/shifts/data/models/shift_model.dart';
import 'package:nursing_home/features/shifts/domain/entities/shift.dart';
import 'package:nursing_home/features/shifts/domain/usecases/usecases.dart';
import 'package:injectable/injectable.dart';

part 'shifts_state.dart';

@injectable
class ShiftsCubit extends Cubit<ShiftsState> {
  ShiftsCubit(
    this._getAllShiftsUseCase,
  ) : super(const ShiftsInitial());

  final GetAllShiftsUseCase _getAllShiftsUseCase;
  StreamSubscription? _streamSubscription;

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    await super.close();
  }

  static ShiftsCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getAllShifts() async {
    _streamSubscription ??=
        _getAllShiftsUseCase(params: '').map(ShiftsSuccess.new).listen(emit);
  }
}
