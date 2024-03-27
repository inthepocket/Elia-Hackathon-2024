import '../domain/entities/charging_session.dart';
import '../domain/entities/vehicle.dart';
import '../domain/entities/vehicle_state.dart';
import '../domain/extensions/charging_session_extensions.dart';
import '../domain/extensions/vehicle_extensions.dart';
import '../domain/extensions/vehicle_state_extensions.dart';
import '../domain/home_data_manager.dart';
import 'api/home_api_provider.dart';

class HomeDataManagerImpl implements HomeDataManager {
  HomeDataManagerImpl(
    this._homeApiProvider,
  );

  final HomeApiProvider _homeApiProvider;

  @override
  Future<List<ChargingSession>> getChargingSessions({required String ean, required String realTime}) async {
    final models = await _homeApiProvider.getChargingSessions(ean: ean, realTime: realTime);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Vehicle>> getVehicles() async {
    final models = await _homeApiProvider.getVehicles();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<VehicleState> getVehicleState({required String ean}) async {
    final model = await _homeApiProvider.getVehicleState(ean: ean);
    return model.toEntity();
  }
}
