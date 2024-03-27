import '../entities/vehicle.dart';
import '../home_data_manager.dart';

abstract class GetVehiclesUseCase {
  Future<List<Vehicle>> call();
}

class GetVehiclesUseCaseImpl implements GetVehiclesUseCase {
  GetVehiclesUseCaseImpl(
    this._homeDataManager,
  );

  final HomeDataManager _homeDataManager;

  @override
  Future<List<Vehicle>> call() async {
    return _homeDataManager.getVehicles();
  }
}
