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
      currentRealTimePrice: (json['CurrentRealTimePrice'] as num).toDouble(),
      mostRecentSessions: (json['SessionsLast5Days'] as List<dynamic>?)
          ?.map((e) => ChargingSessionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VehicleStateModelToJson(VehicleStateModel instance) =>
    <String, dynamic>{
      'Metadata': instance.metadata,
      'CurrentState': instance.currentState,
      'CurrentRealTimePrice': instance.currentRealTimePrice,
      'SessionsLast5Days': instance.mostRecentSessions,
    };
