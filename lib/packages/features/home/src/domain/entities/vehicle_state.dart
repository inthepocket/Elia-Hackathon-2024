import 'package:equatable/equatable.dart';

import 'charging_session.dart';
import 'charging_session_state.dart';
import 'vehicle.dart';

class VehicleState extends Equatable {
  final Vehicle metaData;
  final ChargingSessionState currentState;
  final List<ChargingSession> mostRecentSessions;

  const VehicleState({
    required this.metaData,
    required this.currentState,
    required this.mostRecentSessions,
  });

  @override
  List<Object?> get props => [
        metaData,
        currentState,
        mostRecentSessions,
      ];
}
