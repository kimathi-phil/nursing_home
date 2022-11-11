import 'package:equatable/equatable.dart';
import 'package:nursing_home/features/status/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status_model.g.dart';

@JsonSerializable()
class StatusModel extends Equatable {
  const StatusModel({
    required this.id,
    required this.name,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);

  factory StatusModel.fromJsonAndString(Map<String, dynamic> json, String id) {
    return StatusModel(
      id: id,
      name: json['name'] as String? ?? '',
    );
  }

  @JsonKey(name: 'id')
  final String id;
  final String name;

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);

  Map<String, dynamic> toFirestoreJson() => <String, dynamic>{
        'name': name,
      };

  Status toEntity() {
    return Status(
      id: id,
      name: name,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

extension StatusModelX on List<StatusModel> {
  List<Status> toEntities() => map((model) => model.toEntity()).toList();
}
