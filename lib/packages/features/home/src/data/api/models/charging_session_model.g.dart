// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charging_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargingSessionModel _$ChargingSessionModelFromJson(
        Map<String, dynamic> json) =>
    ChargingSessionModel(
      startState: ChargingSessionStateModel.fromJson(
          json['startState'] as Map<String, dynamic>),
      endState: ChargingSessionStateModel.fromJson(
          json['endState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChargingSessionModelToJson(
        ChargingSessionModel instance) =>
    <String, dynamic>{
      'startState': instance.startState,
      'endState': instance.endState,
    };
