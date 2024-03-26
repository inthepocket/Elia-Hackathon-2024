import 'package:dio/dio.dart';
import 'package:elia_hackathon_2024_app/packages/setup/config/config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../happy_hour_api.dart';

part 'pods.g.dart';

@riverpod
HappyHourRestClient happyHourRestClient(HappyHourRestClientRef ref) {
  final appConfig = ref.watch(appConfigProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: appConfig.happyHourBaseUrl,
      sendTimeout: appConfig.happyHourTimeout,
      receiveTimeout: appConfig.happyHourTimeout,
      connectTimeout: appConfig.happyHourTimeout,
    ),
  );

  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ),
  );

  return HappyHourRestClient(dio);
}
