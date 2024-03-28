import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model.g.dart';

@JsonSerializable()
class VehicleModel {
  @JsonKey(name: 'ID')
  final String id;

  @JsonKey(name: 'Model')
  final String model;

  @JsonKey(name: 'Version')
  final String version;

  @JsonKey(name: 'Capacity')
  final double capacity;

  @JsonKey(name: 'RangeKm')
  final double rangeKm;

  @JsonKey(name: 'Ean')
  final String ean;

  @JsonKey(name: 'KmPerKwh')
  final double kmPerKwh;

  @JsonKey(name: 'Reward')
  final double reward;

  const VehicleModel({
    required this.id,
    required this.model,
    required this.version,
    required this.capacity,
    required this.rangeKm,
    required this.ean,
    required this.kmPerKwh,
    required this.reward,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => _$VehicleModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);
}
