import 'package:equatable/equatable.dart';

typedef Statuses = List<Status>;

class Status extends Equatable {
  const Status({
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
