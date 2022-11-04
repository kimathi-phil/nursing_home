import 'package:equatable/equatable.dart';

typedef Tasks = List<Task>;

class Task extends Equatable {
  const Task({
    required this.id,
    this.resident = '',
    this.task = '',
    this.nurse = '',
    this.shift = '',
    this.status = '',
  });

  final String id;
  final String resident;
  final String task;
  final String nurse;
  final String shift;
  final String status;

  @override
  List<Object?> get props => [
        id,
        resident,
        task,
        nurse,
        shift,
        status,
      ];
}
