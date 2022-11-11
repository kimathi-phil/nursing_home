part of 'status_cubit.dart';

abstract class StatusState extends Equatable {
  const StatusState();

  @override
  List<Object?> get props => [];
}

class StatusInitial extends StatusState {
  const StatusInitial();
}

class StatusLoading extends StatusState {
  const StatusLoading();
}

class StatusesSuccess extends StatusState {
  const StatusesSuccess(this.statuses);
  final Statuses statuses;

  @override
  List<Object?> get props => [statuses];
}

class StatusSuccess extends StatusState {
  const StatusSuccess(this.status);
  final StatusModel status;

  @override
  List<Object?> get props => [status];
}

class StatusFailed extends StatusState {
  const StatusFailed(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
