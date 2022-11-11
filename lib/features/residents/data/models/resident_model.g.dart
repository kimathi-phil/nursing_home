// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResidentModel _$ResidentModelFromJson(Map<String, dynamic> json) =>
    ResidentModel(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$ResidentModelToJson(ResidentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
