import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.uid,
    required this.email,
    required this.photoUrl,
    required this.displayName,
  });

  final String uid;
  final String email;
  final String photoUrl;
  final String displayName;

  @override
  List<Object?> get props => [
        uid,
        email,
        photoUrl,
        displayName,
      ];
}
