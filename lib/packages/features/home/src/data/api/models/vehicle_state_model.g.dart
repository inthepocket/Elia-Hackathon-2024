// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleStateModel _$VehicleStateModelFromJson(Map<String, dynamic> json) =>
    VehicleStateModel(
      metadata: VehicleModel.fromJson(json['Metadata'] as Map<String, dynamic>),
      currentState: ChargingSessionStateModel.fromJson(
          json['CurrentState'] as Map<String, dynamic>),
      sessionsLast24hours: (json['SessionsLast24hours'] as List<dynamic>?)
          ?.map((e) => ChargingSessionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VehicleStateModelToJson(VehicleStateModel instance) =>
    <String, dynamic>{
      'Metadata': instance.metadata,
      'CurrentState': instance.currentState,
      'SessionsLast24hours': instance.sessionsLast24hours,
    };
