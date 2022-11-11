import 'package:equatable/equatable.dart';

typedef Residents = List<Resident>;

class Resident extends Equatable {
  const Resident({
    required this.id,
    this.name = '',
  });

  final String id;
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
