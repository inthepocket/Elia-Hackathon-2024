import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/assets_provider.dart';

part 'pods.g.dart';

@riverpod
AssetsProvider assetsProvider(AssetsProviderRef ref) {
  return AssetsProviderImpl();
}
