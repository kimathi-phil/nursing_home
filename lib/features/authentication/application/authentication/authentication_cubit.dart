import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/features/authentication/domain/entities/entities.dart';
import 'package:flutter_playground/features/authentication/domain/usecases/usecases.dart';
import 'package:injectable/injectable.dart';
part 'authentication_state.dart';

@injectable
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(
    this.signInUseCase,
  ) : super(const AuthenticationInitial());

  SignInUseCase signInUseCase;
  User? user;

  static AuthenticationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> logIn(UserDetails userInfo) async {
    emit(const AuthenticationLoading());
    await signInUseCase(params: userInfo).then((user) {
      emit(AuthenticationSuccess(user));
      this.user = user;
    }).catchError((dynamic e) {
      emit(AuthenticationFailed(e.toString()));
    });
  }
}
