import '../../data/api/models/vehicle_state_model.dart';
import '../entities/vehicle_state.dart';
import 'charging_session_extensions.dart';
import 'vehicle_extensions.dart';

extension VehicleStateModelX on VehicleStateModel {
  VehicleState toEntity() {
    return VehicleState(
      metaData: metadata.toEntity(),
      currentState: currentState.toEntity(),
      currentRealTimePrice: currentRealTimePrice,
      mostRecentSessions: mostRecentSessions == null ? [] : mostRecentSessions!.map((e) => e.toEntity()).toList(),
    );
  }
}
