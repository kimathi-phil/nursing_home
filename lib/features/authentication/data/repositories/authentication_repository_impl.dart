import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_playground/features/authentication/data/remote_sources/firebase_authentication.dart';
import 'package:flutter_playground/features/authentication/domain/entities/registered_user.dart';
import 'package:flutter_playground/features/authentication/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<User> logIn(UserDetails userInfo) async {
    try {
      return await FirebaseAuthentication.logIn(
        email: userInfo.email,
        password: userInfo.password,
      );
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
