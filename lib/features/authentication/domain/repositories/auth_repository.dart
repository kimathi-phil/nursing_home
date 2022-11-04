import 'package:firebase_auth/firebase_auth.dart';
import 'package:nursing_home/features/authentication/domain/entities/registered_user.dart';

abstract class AuthenticationRepository {
  Future<User> logIn(UserDetails userInfo);
}
