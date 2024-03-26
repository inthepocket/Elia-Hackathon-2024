import 'package:equatable/equatable.dart';

import 'charging_session_state.dart';

class ChargingSession extends Equatable {
  const ChargingSession({
    required this.startState,
    required this.endState,
  });

  final ChargingSessionState startState;
  final ChargingSessionState endState;

  @override
  List<Object> get props => [
        startState,
        endState,
      ];
}
