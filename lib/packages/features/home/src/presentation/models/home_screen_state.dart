import '../../domain/entities/vehicle.dart';
import '../../domain/entities/vehicle_state.dart';

sealed class HomeScreenState {
  const HomeScreenState();
}

class HomeScreenLoading extends HomeScreenState {
  const HomeScreenLoading();
}

class HomeScreenError extends HomeScreenState {
  const HomeScreenError();
}

class HomeScreenData extends HomeScreenState {
  final List<Vehicle> vehicles;
  final VehicleState selectedVehicleState;

  const HomeScreenData({
    required this.vehicles,
    required this.selectedVehicleState,
  });
}
