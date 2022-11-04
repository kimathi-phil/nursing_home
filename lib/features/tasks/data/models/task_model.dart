import 'package:equatable/equatable.dart';
import 'package:nursing_home/features/tasks/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel extends Equatable {
  const TaskModel({
    required this.id,
    this.resident = '',
    this.task = '',
    this.nurse = '',
    this.shift = '',
    this.status = '',
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  final String resident;
  final String task;
  final String nurse;
  final String shift;
  final String status;

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

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

var todos = [
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
  const TaskModel(
    id: 'xHd4LbEXR7J1PHQHkuCv',
    resident: 'Mr. Müller',
    task: 'needs to be washed and have his breakfast finished until 11 am',
    nurse: 'Marc',
    shift: 'Morning',
    status: 'Open',
  ),
];
