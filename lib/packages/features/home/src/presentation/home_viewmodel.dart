import 'package:flutter/material.dart';

import '../domain/use_cases/get_charging_sessions_use_case.dart';

class HomeViewModel {
  static const _tag = 'HomeViewModel';

  HomeViewModel(
    this._getChargingSessions,
  );

  final GetChargingSessionsUseCase _getChargingSessions;

  Future<void> init() async {
    debugPrint('$_tag - init()');

    try {
      final realtime = DateTime.now().toUtc().toString();

      debugPrint('Realtime: $realtime');

      final chargingSessions = await _getChargingSessions(
        ean: '541983310278725782',
        realTime: DateTime.now().toUtc().toString(),
      );

      debugPrint(chargingSessions.toString());
    } catch (e) {
      debugPrint('An error occurred while fetching the charging sessions: $e');
    }
  }

  Future<void> onChargingSessionRequested({
    required DateTime departureTime,
    required double desiredRange,
  }) async {
    debugPrint('$_tag - onChargingSessionRequested(departureTime: $departureTime, desiredRange: $desiredRange)');

    final formattedDepartureTime = '${departureTime.hour}:${departureTime.minute}';
    final roundedDesiredRange = desiredRange.round();

    debugPrint('Departure time: $formattedDepartureTime, desired range: $roundedDesiredRange km');
  }
}
