import 'package:json_annotation/json_annotation.dart';

part 'charging_session_state_model.g.dart';

@JsonSerializable()
class ChargingSessionStateModel {
  const ChargingSessionStateModel({
    required this.id,
    required this.assetType,
    required this.socMax,
    required this.chargingMax,
    required this.soc,
    required this.lastSoc,
    required this.connected,
    required this.emptyOnReconnect,
    required this.stateTime,
    required this.ean,
    required this.assetMode,
    required this.maxProduction,
    required this.production,
    required this.requestedProduction,
    required this.consumption,
    required this.requestedConsumption,
    required this.steerableConsumption,
    required this.steerableProduction,
  });

  @JsonKey(name: r'$id')
  final String id;

  @JsonKey(name: r'$AssetType')
  final String assetType;

  final double socMax;
  final double chargingMax;
  final double soc;
  final double lastSoc;
  final bool connected;
  final bool emptyOnReconnect;
  final String stateTime;
  final String ean;
  final String assetMode;
  final double maxProduction;
  final double production;
  final double requestedProduction;
  final double consumption;
  final double requestedConsumption;
  final bool steerableConsumption;
  final bool steerableProduction;

  factory ChargingSessionStateModel.fromJson(Map<String, dynamic> json) => _$ChargingSessionStateModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChargingSessionStateModelToJson(this);
}
