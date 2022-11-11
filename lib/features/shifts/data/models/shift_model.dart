import 'package:equatable/equatable.dart';
import 'package:nursing_home/features/shifts/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shift_model.g.dart';

@JsonSerializable()
class ShiftModel extends Equatable {
  const ShiftModel({
    required this.id,
    required this.name,
  });

  factory ShiftModel.fromJson(Map<String, dynamic> json) =>
      _$ShiftModelFromJson(json);

  factory ShiftModel.fromJsonAndString(Map<String, dynamic> json, String id) {
    return ShiftModel(
      id: id,
      name: json['name'] as String? ?? '',
    );
  }

  @JsonKey(name: 'id')
  final String id;
  final String name;

  Map<String, dynamic> toJson() => _$ShiftModelToJson(this);

  Map<String, dynamic> toFirestoreJson() => <String, dynamic>{
        'name': name,
      };

  Shift toEntity() {
    return Shift(
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

extension ShifttModelX on List<ShiftModel> {
  List<Shift> toEntities() => map((model) => model.toEntity()).toList();
}
