import '../../data/api/models/charging_session_model.dart';
import '../../data/api/models/charging_session_state_model.dart';
import '../entities/charging_session.dart';
import '../entities/charging_session_state.dart';

extension ChargingSessionModelX on ChargingSessionModel {
  ChargingSession toEntity() {
    return ChargingSession(
      startState: startState.toEntity(),
      endState: endState.toEntity(),
    );
  }
}

extension ChargingSessionStateModelX on ChargingSessionStateModel {
  ChargingSessionState toEntity() {
    return ChargingSessionState(
      id: id,
      assetType: assetType,
      socMax: socMax,
      chargingMax: chargingMax,
      soc: soc,
      lastSoc: lastSoc,
      connected: connected,
      emptyOnReconnect: emptyOnReconnect,
      stateTime: stateTime,
      ean: ean,
      assetMode: assetMode,
      maxProduction: maxProduction,
      production: production,
      requestedProduction: requestedProduction,
      consumption: consumption,
      requestedConsumption: requestedConsumption,
      steerableConsumption: steerableConsumption,
      steerableProduction: steerableProduction,
    );
  }
}
