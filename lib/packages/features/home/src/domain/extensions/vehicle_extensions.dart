import '../../data/api/models/vehicle_model.dart';
import '../entities/vehicle.dart';

extension VehicleModelX on VehicleModel {
  Vehicle toEntity() {
    return Vehicle(
      id: id,
      model: model,
      version: version,
      capacity: capacity,
      rangeKm: rangeKm,
      ean: ean,
      kmPerKwh: kmPerKwh,
    );
  }
}
