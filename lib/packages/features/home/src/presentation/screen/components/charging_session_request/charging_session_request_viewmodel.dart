import 'package:flutter/widgets.dart';

class ChargingSessionRequestViewModel extends ValueNotifier<int> {
  static const _tag = 'ChargingSessionRequestViewModel';

  ChargingSessionRequestViewModel({
    required this.initialDepartureTime,
    required this.initialRange,
    required this.maxRange,
  }) : super(0) {
    debugPrint('$_tag - ChargingSessionRequestViewModel()');
  }

  final DateTime initialDepartureTime;
  final double initialRange;
  final double maxRange;

  DateTime? _departureTime;
  double? _desiredRange;

  void onBackPressed() => value--;

  void onNextPressed() => value++;

  DateTime get departureTime => _departureTime ?? initialDepartureTime;

  void onDepartureTimeSelected(DateTime departureTime) {
    _departureTime = departureTime;
  }

  double get desiredRange => _desiredRange ?? initialRange;

  void onDesiredRangeSelected(double desiredRange) {
    _desiredRange = desiredRange;
  }
}
