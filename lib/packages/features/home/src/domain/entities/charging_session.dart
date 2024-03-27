import 'package:equatable/equatable.dart';

import '../../data/api/models/charge_period.dart';
import 'charging_session_state.dart';

class ChargingSession extends Equatable {
  const ChargingSession({
    required this.startState,
    this.endState,
    required this.chargePeriods,
  });

  final ChargingSessionState startState;
  final ChargingSessionState? endState;
  final List<ChargePeriod> chargePeriods;

  @override
  List<Object?> get props => [
        startState,
        endState,
        chargePeriods,
      ];
}
