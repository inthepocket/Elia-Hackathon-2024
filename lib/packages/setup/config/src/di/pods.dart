import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../app_config.dart';

part 'pods.g.dart';

@riverpod
AppConfig appConfig(AppConfigRef ref) {
  return const AppConfig();
}
