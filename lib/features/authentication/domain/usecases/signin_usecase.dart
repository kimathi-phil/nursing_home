import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_playground/core/usecases/usecases.dart';
import 'package:flutter_playground/features/authentication/domain/entities/registered_user.dart';
import 'package:flutter_playground/features/authentication/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInUseCase implements UseCase<User, UserDetails> {
  SignInUseCase(this._firebaseAuthRepository);

  final AuthenticationRepository _firebaseAuthRepository;

  @override
  Future<User> call({required UserDetails params}) {
    return _firebaseAuthRepository.logIn(params);
  }
}
