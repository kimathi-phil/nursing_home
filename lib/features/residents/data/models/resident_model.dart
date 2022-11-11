import 'package:equatable/equatable.dart';
import 'package:nursing_home/features/residents/domain/entities/resident.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resident_model.g.dart';

@JsonSerializable()
class ResidentModel extends Equatable {
  const ResidentModel({
    required this.id,
    this.name = '',
  });

  factory ResidentModel.fromJson(Map<String, dynamic> json) =>
      _$ResidentModelFromJson(json);

  factory ResidentModel.fromJsonAndString(
      Map<String, dynamic> json, String id) {
    return ResidentModel(
      id: id,
      name: json['name'] as String? ?? '',
    );
  }

  @JsonKey(name: 'id')
  final String id;
  final String name;

  Map<String, dynamic> toJson() => _$ResidentModelToJson(this);

  Map<String, dynamic> toFirestoreJson() => <String, dynamic>{
        'name': name,
      };

  Resident toEntity() {
    return Resident(
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

extension ResidentModelX on List<ResidentModel> {
  List<Resident> toEntities() => map((model) => model.toEntity()).toList();
}
