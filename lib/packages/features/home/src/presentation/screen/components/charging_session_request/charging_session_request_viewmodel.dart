import 'package:flutter/widgets.dart';

class ChargingSessionRequestViewModel extends ValueNotifier<int> {
  ChargingSessionRequestViewModel({
    required this.initialRange,
    required this.maxRange,
  }) : super(0);

  final double initialRange;
  final double maxRange;

  late DateTime departureTime;
  late double desiredRange;

  void onBackPressed() => value--;

  void onNextPressed() => value++;

  void onDepartureTimeSelected(DateTime departureTime) {
    this.departureTime = departureTime;
  }

  void onDesiredRangeSelected(double desiredRange) {
    this.desiredRange = desiredRange;
  }
}
