part of 'shifts_cubit.dart';

abstract class ShiftsState extends Equatable {
  const ShiftsState();

  @override
  List<Object?> get props => [];
}

class ShiftsInitial extends ShiftsState {
  const ShiftsInitial();
}

class ShiftsLoading extends ShiftsState {
  const ShiftsLoading();
}

class ShiftsSuccess extends ShiftsState {
  const ShiftsSuccess(this.shifts);
  final Shifts shifts;

  @override
  List<Object?> get props => [shifts];
}

class ShiftSuccess extends ShiftsState {
  const ShiftSuccess(this.shift);
  final ShiftModel shift;

  @override
  List<Object?> get props => [shift];
}

class ShiftsFailed extends ShiftsState {
  const ShiftsFailed(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
