import 'package:equatable/equatable.dart';

import 'charging_session_state.dart';

class ChargingSession extends Equatable {
  const ChargingSession({
    required this.startState,
    this.chargedState,
    this.endState,
  });

  final ChargingSessionState startState;
  final ChargingSessionState? chargedState;
  final ChargingSessionState? endState;

  @override
  List<Object?> get props => [
        startState,
        chargedState,
        endState,
      ];
}
