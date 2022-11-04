import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_playground/features/authentication/domain/entities/registered_user.dart';

abstract class AuthenticationRepository {
  Future<User> logIn(UserDetails userInfo);
}
