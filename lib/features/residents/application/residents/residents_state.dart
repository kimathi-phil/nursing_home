part of 'residents_cubit.dart';

abstract class ResidentsState extends Equatable {
  const ResidentsState();

  @override
  List<Object?> get props => [];
}

class ResidentsInitial extends ResidentsState {
  const ResidentsInitial();
}

class ResidentsLoading extends ResidentsState {
  const ResidentsLoading();
}

class ResidentsSuccess extends ResidentsState {
  const ResidentsSuccess(this.residents);
  final Residents residents;

  @override
  List<Object?> get props => [residents];
}

class ResidentSuccess extends ResidentsState {
  const ResidentSuccess(this.resident);
  final ResidentModel resident;

  @override
  List<Object?> get props => [resident];
}

class ResidentsFailed extends ResidentsState {
  const ResidentsFailed(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
