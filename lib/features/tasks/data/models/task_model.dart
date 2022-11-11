import 'package:equatable/equatable.dart';
import 'package:nursing_home/features/tasks/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel extends Equatable {
  const TaskModel({
    this.id = '',
    required this.resident,
    required this.task,
    required this.nurse,
    required this.shift,
    required this.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  factory TaskModel.fromJsonAndString(Map<String, dynamic> json, String id) {
    return TaskModel(
      id: id,
      resident: json['resident'] as String? ?? '',
      task: json['task'] as String? ?? '',
      nurse: json['nurse'] as String? ?? '',
      shift: json['shift'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );
  }

  @JsonKey(name: 'id')
  final String id;
  final String resident;
  final String task;
  final String nurse;
  final String shift;
  final String status;

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  Map<String, dynamic> toFirestoreJson() => <String, dynamic>{
        'resident': resident,
        'task': task,
        'nurse': nurse,
        'shift': shift,
        'status': status,
      };

  Task toEntity() {
    return Task(
      id: id,
      resident: resident,
      task: task,
      nurse: nurse,
      shift: shift,
      status: status,
    );
  }

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

extension TaskModelX on List<TaskModel> {
  List<Task> toEntities() => map((model) => model.toEntity()).toList();
}
