import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/di/pods.dart';
import '../home_viewmodel.dart';
import '../screen/components/charging_session_request/charging_session_request_viewmodel.dart';

part 'pods.g.dart';

@riverpod
HomeViewModel homeViewModel(HomeViewModelRef ref) {
  final getChargingSessionsUseCase = ref.watch(getChargingSessionsUseCaseProvider);

  return HomeViewModel(
    getChargingSessionsUseCase,
  );
}

@riverpod
ChargingSessionRequestViewModel chargingSessionRequestViewModel(
  ChargingSessionRequestViewModelRef ref, {
  required DateTime initialDepartureTime,
  required double initialRange,
  required double maxRange,
}) {
  return ChargingSessionRequestViewModel(
    initialDepartureTime: initialDepartureTime,
    initialRange: initialRange,
    maxRange: maxRange,
  );
}
