import 'package:equatable/equatable.dart';

class ChargePeriod extends Equatable {
  final DateTime startTime;
  final DateTime endTime;
  final double socAtStart;
  final double socAtEnd;
  final double chargedKwh;

  const ChargePeriod({
    required this.startTime,
    required this.endTime,
    required this.socAtStart,
    required this.socAtEnd,
    required this.chargedKwh,
  });

  @override
  List<Object?> get props => [
        startTime,
        endTime,
        socAtStart,
        socAtEnd,
        chargedKwh,
      ];
}
