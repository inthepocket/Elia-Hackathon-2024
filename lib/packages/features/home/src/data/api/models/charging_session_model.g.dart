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
      endState: json['endState'] == null
          ? null
          : ChargingSessionStateModel.fromJson(
              json['endState'] as Map<String, dynamic>),
      chargePeriods: (json['ChargePeriods'] as List<dynamic>?)
          ?.map((e) => ChargePeriodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChargingSessionModelToJson(
        ChargingSessionModel instance) =>
    <String, dynamic>{
      'startState': instance.startState,
      'endState': instance.endState,
      'ChargePeriods': instance.chargePeriods,
    };
