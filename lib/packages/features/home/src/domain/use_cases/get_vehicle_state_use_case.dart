import '../entities/vehicle_state.dart';
import '../home_data_manager.dart';

abstract class GetVehicleStateUseCase {
  Future<VehicleState> call({
    required String ean,
  });
}

class GetVehicleStateUseCaseImpl implements GetVehicleStateUseCase {
  GetVehicleStateUseCaseImpl(
    this._homeDataManager,
  );

  final HomeDataManager _homeDataManager;

  @override
  Future<VehicleState> call({
    required String ean,
  }) async {
    return _homeDataManager.getVehicleState(ean: ean);
  }
}
