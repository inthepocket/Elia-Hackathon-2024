// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charging_session_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargingSessionStateModel _$ChargingSessionStateModelFromJson(
        Map<String, dynamic> json) =>
    ChargingSessionStateModel(
      id: json[r'$id'] as String,
      assetType: json[r'$AssetType'] as String,
      socMax: (json['socMax'] as num).toDouble(),
      chargingMax: (json['chargingMax'] as num).toDouble(),
      soc: (json['soc'] as num).toDouble(),
      lastSoc: (json['lastSoc'] as num).toDouble(),
      connected: json['connected'] as bool,
      emptyOnReconnect: json['emptyOnReconnect'] as bool,
      stateTime: DateTime.parse(json['stateTime'] as String),
      ean: json['ean'] as String,
      assetMode: json['assetMode'] as String,
      maxProduction: (json['maxProduction'] as num).toDouble(),
      production: (json['production'] as num).toDouble(),
      requestedProduction: (json['requestedProduction'] as num).toDouble(),
      consumption: (json['consumption'] as num).toDouble(),
      requestedConsumption: (json['requestedConsumption'] as num).toDouble(),
      steerableConsumption: json['steerableConsumption'] as bool,
      steerableProduction: json['steerableProduction'] as bool,
    );

Map<String, dynamic> _$ChargingSessionStateModelToJson(
        ChargingSessionStateModel instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      r'$AssetType': instance.assetType,
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
