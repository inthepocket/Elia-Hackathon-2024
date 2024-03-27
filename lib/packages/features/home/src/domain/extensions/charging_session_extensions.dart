import '../../data/api/models/charge_period.dart';
import '../../data/api/models/charge_period_model.dart';
import '../../data/api/models/charging_session_model.dart';
import '../../data/api/models/charging_session_state_model.dart';
import '../entities/charging_session.dart';
import '../entities/charging_session_state.dart';

extension ChargingSessionModelX on ChargingSessionModel {
  ChargingSession toEntity() {
    return ChargingSession(
      startState: startState.toEntity(),
      endState: endState?.toEntity(),
      chargePeriods: chargePeriods == null ? [] : chargePeriods!.map((e) => e.toEntity()).toList(),
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

extension ChargePeriodModelX on ChargePeriodModel {
  ChargePeriod toEntity() {
    return ChargePeriod(
      startTime: startTime,
      endTime: endTime,
      socAtStart: socAtStart,
      socAtEnd: socAtEnd,
      chargedKwh: chargedKwh,
    );
  }
}
