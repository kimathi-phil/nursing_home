part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();
}

class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess(this.user);
  final User user;

  @override
  List<Object?> get props => [user];
}

class AuthenticationFailed extends AuthenticationState {
  const AuthenticationFailed(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
