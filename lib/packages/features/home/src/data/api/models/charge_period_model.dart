import 'package:json_annotation/json_annotation.dart';

part 'charge_period_model.g.dart';

@JsonSerializable()
class ChargePeriodModel {
  @JsonKey(name: 'StartTime')
  final DateTime startTime;

  @JsonKey(name: 'EndTime')
  final DateTime endTime;

  @JsonKey(name: 'SocAtStart')
  final double socAtStart;

  @JsonKey(name: 'SocAtEnd')
  final double socAtEnd;

  @JsonKey(name: 'ChargedKwh')
  final double chargedKwh;

  ChargePeriodModel({
    required this.startTime,
    required this.endTime,
    required this.socAtStart,
    required this.socAtEnd,
    required this.chargedKwh,
  });

  factory ChargePeriodModel.fromJson(Map<String, dynamic> json) => _$ChargePeriodModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChargePeriodModelToJson(this);
}
