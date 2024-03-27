import 'package:json_annotation/json_annotation.dart';

import 'charge_period_model.dart';
import 'charging_session_state_model.dart';

part 'charging_session_model.g.dart';

@JsonSerializable()
class ChargingSessionModel {
  const ChargingSessionModel({
    required this.startState,
    this.endState,
    this.chargePeriods,
  });

  @JsonKey(name: 'StartState')
  final ChargingSessionStateModel startState;

  @JsonKey(name: 'EndState')
  final ChargingSessionStateModel? endState;

  @JsonKey(name: 'ChargePeriods')
  final List<ChargePeriodModel>? chargePeriods;

  factory ChargingSessionModel.fromJson(Map<String, dynamic> json) => _$ChargingSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChargingSessionModelToJson(this);
}
