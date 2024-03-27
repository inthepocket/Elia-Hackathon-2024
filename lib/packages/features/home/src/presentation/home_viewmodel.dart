import 'package:flutter/material.dart';

import '../domain/entities/vehicle.dart';
import '../domain/use_cases/get_charging_sessions_use_case.dart';
import '../domain/use_cases/get_vehicle_state_use_case.dart';
import '../domain/use_cases/get_vehicles_use_case.dart';
import 'models/home_screen_state.dart';

class HomeViewModel extends ValueNotifier<HomeScreenState> {
  static const _tag = 'HomeViewModel';

  HomeViewModel(
    this._getChargingSessionsUseCase,
    this._getVehiclesUseCase,
    this._getVehicleStateUseCase,
  ) : super(const HomeScreenLoading());

  final GetChargingSessionsUseCase _getChargingSessionsUseCase;
  final GetVehiclesUseCase _getVehiclesUseCase;
  final GetVehicleStateUseCase _getVehicleStateUseCase;

  Future<void> init() async {
    debugPrint('$_tag - init()');

    await _getVehicles();
  }

  Future<void> _getVehicles() async {
    debugPrint('$_tag - _getVehicles()');

    try {
      final vehicles = await _getVehiclesUseCase();
      debugPrint(vehicles.toString());

      final selectedVehicle = vehicles.first;
      final selectedVehicleState = await _getVehicleStateUseCase(ean: selectedVehicle.ean);

      value = HomeScreenData(
        vehicles: vehicles,
        selectedVehicleState: selectedVehicleState,
      );
    } catch (e) {
      debugPrint('An error occurred while fetching the vehicles: $e');

      value = const HomeScreenError();
    }
  }

  Future<void> onVehicleSelected(Vehicle vehicle) async {
    debugPrint('$_tag - onVehicleSelected(model: ${vehicle.model}, ean: ${vehicle.ean})');

    final currentValue = value;
    if (currentValue is! HomeScreenData) {
      return;
    }

    try {
      final selectedVehicleState = await _getVehicleStateUseCase(ean: vehicle.ean);

      value = HomeScreenData(
        vehicles: currentValue.vehicles,
        selectedVehicleState: selectedVehicleState,
      );
    } catch (e) {
      debugPrint('An error occurred while updating the selected vehicle: $e');

      value = const HomeScreenError();
    }
  }

  Future<void> _getChargingSessions() async {
    debugPrint('$_tag - _getChargingSessions()');

    try {
      final realtime = DateTime.now().toUtc().toString();
      debugPrint('Realtime: $realtime');

      final chargingSessions = await _getChargingSessionsUseCase(
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
