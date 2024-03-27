import 'package:elia_hackathon_2024_app/packages/core_services/happy_hour/happy_hour.dart';

import 'models/charging_session_model.dart';
import 'models/vehicle_model.dart';

abstract class HomeApiProvider {
  Future<List<ChargingSessionModel>> getChargingSessions({
    required String ean,
    required String realTime,
  });

  Future<List<VehicleModel>> getVehicles();
}

class HomeApiProviderImpl implements HomeApiProvider {
  HomeApiProviderImpl(
    this._happyHourRestClient,
  );

  final HappyHourRestClient _happyHourRestClient;

  @override
  Future<List<ChargingSessionModel>> getChargingSessions({
    required String ean,
    required String realTime,
  }) async {
    return _happyHourRestClient.getChargingSessions(ean: ean, realTime: realTime);
  }

  @override
  Future<List<VehicleModel>> getVehicles() async {
    return _happyHourRestClient.getVehicles();
  }
}
