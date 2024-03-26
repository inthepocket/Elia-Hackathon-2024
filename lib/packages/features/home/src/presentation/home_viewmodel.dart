import 'package:flutter/material.dart';

import '../domain/use_cases/get_charging_sessions_use_case.dart';

class HomeViewModel {
  HomeViewModel(
    this._getChargingSessions,
  );

  final GetChargingSessionsUseCase _getChargingSessions;

  Future<void> init() async {
    try {
      final chargingSessions = await _getChargingSessions(
        ean: '541983310278725782',
        realTime: DateTime.now().toUtc().toString(),
      );

      debugPrint(chargingSessions.toString());
    } catch (e) {
      debugPrint('An error occurred while fetching the charging sessions: $e');
    }
  }
}
