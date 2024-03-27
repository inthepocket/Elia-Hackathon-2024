import '../../domain/entities/vehicle.dart';

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
  final Vehicle selectedVehicle;

  const HomeScreenData({
    required this.vehicles,
    required this.selectedVehicle,
  });
}
