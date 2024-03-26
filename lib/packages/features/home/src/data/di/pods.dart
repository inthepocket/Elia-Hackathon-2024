import 'package:elia_hackathon_2024_app/packages/core_services/happy_hour/happy_hour.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/home_data_manager.dart';
import '../api/home_api_provider.dart';
import '../home_data_manager.dart';

part 'pods.g.dart';

@riverpod
HomeApiProvider homeApiProvider(HomeApiProviderRef ref) {
  final happyHourRestClient = ref.watch(happyHourRestClientProvider);

  return HomeApiProviderImpl(
    happyHourRestClient,
  );
}

@riverpod
HomeDataManager homeDataManager(HomeDataManagerRef ref) {
  final homeApiProvider = ref.watch(homeApiProviderProvider);

  return HomeDataManagerImpl(
    homeApiProvider,
  );
}
