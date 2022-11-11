import 'package:equatable/equatable.dart';

typedef Shifts = List<Shift>;

class Shift extends Equatable {
  const Shift({
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
