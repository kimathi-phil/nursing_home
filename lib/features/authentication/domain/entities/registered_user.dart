import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
  const UserDetails({this.email = '', this.password = ''});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
