// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charging_session_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargingSessionStateModel _$ChargingSessionStateModelFromJson(
        Map<String, dynamic> json) =>
    ChargingSessionStateModel(
      id: json['id'] as String,
      assetType: json['assetType'] as String,
      socMax: json['socMax'] as int,
      chargingMax: json['chargingMax'] as int,
      soc: (json['soc'] as num).toDouble(),
      lastSoc: json['lastSoc'] as int,
      connected: json['connected'] as bool,
      emptyOnReconnect: json['emptyOnReconnect'] as bool,
      stateTime: DateTime.parse(json['stateTime'] as String),
      ean: json['ean'] as String,
      assetMode: json['assetMode'] as String,
      maxProduction: json['maxProduction'] as int,
      production: json['production'] as int,
      requestedProduction: json['requestedProduction'] as int,
      consumption: json['consumption'] as int,
      requestedConsumption: json['requestedConsumption'] as int,
      steerableConsumption: json['steerableConsumption'] as bool,
      steerableProduction: json['steerableProduction'] as bool,
    );

Map<String, dynamic> _$ChargingSessionStateModelToJson(
        ChargingSessionStateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assetType': instance.assetType,
      'socMax': instance.socMax,
      'chargingMax': instance.chargingMax,
      'soc': instance.soc,
      'lastSoc': instance.lastSoc,
      'connected': instance.connected,
      'emptyOnReconnect': instance.emptyOnReconnect,
      'stateTime': instance.stateTime.toIso8601String(),
      'ean': instance.ean,
      'assetMode': instance.assetMode,
      'maxProduction': instance.maxProduction,
      'production': instance.production,
      'requestedProduction': instance.requestedProduction,
      'consumption': instance.consumption,
      'requestedConsumption': instance.requestedConsumption,
      'steerableConsumption': instance.steerableConsumption,
      'steerableProduction': instance.steerableProduction,
    };
