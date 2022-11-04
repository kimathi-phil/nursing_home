// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'] as String,
      resident: json['resident'] as String? ?? '',
      task: json['task'] as String? ?? '',
      nurse: json['nurse'] as String? ?? '',
      shift: json['shift'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'resident': instance.resident,
      'task': instance.task,
      'nurse': instance.nurse,
      'shift': instance.shift,
      'status': instance.status,
    };
