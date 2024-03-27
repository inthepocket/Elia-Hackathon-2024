// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charging_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargingSessionModel _$ChargingSessionModelFromJson(
        Map<String, dynamic> json) =>
    ChargingSessionModel(
      startState: ChargingSessionStateModel.fromJson(
          json['StartState'] as Map<String, dynamic>),
      endState: json['EndState'] == null
          ? null
          : ChargingSessionStateModel.fromJson(
              json['EndState'] as Map<String, dynamic>),
      chargePeriods: (json['ChargePeriods'] as List<dynamic>?)
          ?.map((e) => ChargePeriodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChargingSessionModelToJson(
        ChargingSessionModel instance) =>
    <String, dynamic>{
      'StartState': instance.startState,
      'EndState': instance.endState,
      'ChargePeriods': instance.chargePeriods,
    };
