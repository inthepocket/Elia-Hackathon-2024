import 'package:json_annotation/json_annotation.dart';

import 'charging_session_state_model.dart';

part 'charging_session_model.g.dart';

@JsonSerializable()
class ChargingSessionModel {
  const ChargingSessionModel({
    required this.startState,
    this.chargedState,
    this.endState,
  });

  final ChargingSessionStateModel startState;
  final ChargingSessionStateModel? chargedState;
  final ChargingSessionStateModel? endState;

  factory ChargingSessionModel.fromJson(Map<String, dynamic> json) => _$ChargingSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChargingSessionModelToJson(this);
}
