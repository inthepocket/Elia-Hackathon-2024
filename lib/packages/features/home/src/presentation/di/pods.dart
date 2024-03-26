import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/di/pods.dart';
import '../home_viewmodel.dart';

part 'pods.g.dart';

@riverpod
HomeViewModel homeViewModel(HomeViewModelRef ref) {
  final getChargingSessionsUseCase = ref.watch(getChargingSessionsUseCaseProvider);

  return HomeViewModel(
    getChargingSessionsUseCase,
  );
}
