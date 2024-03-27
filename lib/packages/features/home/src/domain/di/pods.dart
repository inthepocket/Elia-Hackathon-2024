import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/di/pods.dart';
import '../use_cases/get_charging_sessions_use_case.dart';
import '../use_cases/get_vehicle_state_use_case.dart';
import '../use_cases/get_vehicles_use_case.dart';

part 'pods.g.dart';

@riverpod
GetChargingSessionsUseCase getChargingSessionsUseCase(GetChargingSessionsUseCaseRef ref) {
  final homeDataManager = ref.watch(homeDataManagerProvider);

  return GetChargingSessionsUseCaseImpl(
    homeDataManager,
  );
}

@riverpod
GetVehiclesUseCase getVehiclesUseCase(GetVehiclesUseCaseRef ref) {
  final homeDataManager = ref.watch(homeDataManagerProvider);

  return GetVehiclesUseCaseImpl(
    homeDataManager,
  );
}

@riverpod
GetVehicleStateUseCase getVehicleStateUseCase(GetVehicleStateUseCaseRef ref) {
  final homeDataManager = ref.watch(homeDataManagerProvider);

  return GetVehicleStateUseCaseImpl(
    homeDataManager,
  );
}
