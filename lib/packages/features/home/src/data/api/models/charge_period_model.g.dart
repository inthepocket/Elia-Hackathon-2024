// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_period_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargePeriodModel _$ChargePeriodModelFromJson(Map<String, dynamic> json) =>
    ChargePeriodModel(
      startTime: DateTime.parse(json['StartTime'] as String),
      endTime: DateTime.parse(json['EndTime'] as String),
      socAtStart: (json['SocAtStart'] as num).toDouble(),
      socAtEnd: (json['SocAtEnd'] as num).toDouble(),
      chargedKwh: (json['ChargedKwh'] as num).toDouble(),
    );

Map<String, dynamic> _$ChargePeriodModelToJson(ChargePeriodModel instance) =>
    <String, dynamic>{
      'StartTime': instance.startTime.toIso8601String(),
      'EndTime': instance.endTime.toIso8601String(),
      'SocAtStart': instance.socAtStart,
      'SocAtEnd': instance.socAtEnd,
      'ChargedKwh': instance.chargedKwh,
    };
