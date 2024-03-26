import 'package:equatable/equatable.dart';

class ChargingSessionState extends Equatable {
  const ChargingSessionState({
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

  final String id;
  final String assetType;
  final int socMax;
  final int chargingMax;
  final double soc;
  final int lastSoc;
  final bool connected;
  final bool emptyOnReconnect;
  final DateTime stateTime;
  final String ean;
  final String assetMode;
  final int maxProduction;
  final int production;
  final int requestedProduction;
  final int consumption;
  final int requestedConsumption;
  final bool steerableConsumption;
  final bool steerableProduction;

  @override
  List<Object> get props => [
        id,
        assetType,
        socMax,
        chargingMax,
        soc,
        lastSoc,
        connected,
        emptyOnReconnect,
        stateTime,
        ean,
        assetMode,
        maxProduction,
        production,
        requestedProduction,
        consumption,
        requestedConsumption,
        steerableConsumption,
        steerableProduction,
      ];
}
