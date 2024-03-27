import 'entities/charging_session.dart';
import 'entities/vehicle.dart';

abstract class HomeDataManager {
  Future<List<ChargingSession>> getChargingSessions({
    required String ean,
    required String realTime,
  });

  Future<List<Vehicle>> getVehicles();
}
