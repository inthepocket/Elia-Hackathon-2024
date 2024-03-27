import 'entities/charging_session.dart';
import 'entities/vehicle.dart';
import 'entities/vehicle_state.dart';

abstract class HomeDataManager {
  Future<List<ChargingSession>> getChargingSessions({
    required String ean,
    required String realTime,
  });

  Future<List<Vehicle>> getVehicles();

  Future<VehicleState> getVehicleState({
    required String ean,
  });
}
