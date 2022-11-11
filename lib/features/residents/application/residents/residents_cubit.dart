import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursing_home/features/residents/data/models/resident_model.dart';
import 'package:nursing_home/features/residents/domain/entities/resident.dart';
import 'package:nursing_home/features/residents/domain/usecases/usecases.dart';
import 'package:injectable/injectable.dart';

part 'residents_state.dart';

@injectable
class ResidentsCubit extends Cubit<ResidentsState> {
  ResidentsCubit(
    this._getAllResidentsUseCase,
  ) : super(const ResidentsInitial());

  final GetAllResidentsUseCase _getAllResidentsUseCase;
  StreamSubscription? _streamSubscription;

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    await super.close();
  }

  static ResidentsCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getAllResidents() async {
    _streamSubscription ??= _getAllResidentsUseCase(params: '')
        .map(ResidentsSuccess.new)
        .listen(emit);
  }
}
