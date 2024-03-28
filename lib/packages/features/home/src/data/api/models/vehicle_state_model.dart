import 'package:json_annotation/json_annotation.dart';

import 'charging_session_model.dart';
import 'charging_session_state_model.dart';
import 'vehicle_model.dart';

part 'vehicle_state_model.g.dart';

@JsonSerializable()
class VehicleStateModel {
  @JsonKey(name: 'Metadata')
  final VehicleModel metadata;

  @JsonKey(name: 'CurrentState')
  final ChargingSessionStateModel currentState;

  @JsonKey(name: 'SessionsLast5Days')
  final List<ChargingSessionModel>? mostRecentSessions;

  VehicleStateModel({
    required this.metadata,
    required this.currentState,
    this.mostRecentSessions,
  });

  factory VehicleStateModel.fromJson(Map<String, dynamic> json) => _$VehicleStateModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleStateModelToJson(this);
}
