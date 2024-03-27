// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      id: json['ID'] as String,
      model: json['Model'] as String,
      version: json['Version'] as String,
      capacity: (json['Capacity'] as num).toDouble(),
      rangeKm: (json['RangeKm'] as num).toDouble(),
      ean: json['Ean'] as String,
      kmPerKwh: (json['KmPerKwh'] as num).toDouble(),
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Model': instance.model,
      'Version': instance.version,
      'Capacity': instance.capacity,
      'RangeKm': instance.rangeKm,
      'Ean': instance.ean,
      'KmPerKwh': instance.kmPerKwh,
    };
