import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  final String id;
  final String model;
  final String version;
  final double capacity;
  final double rangeKm;
  final String ean;
  final double kmPerKwh;

  const Vehicle({
    required this.id,
    required this.model,
    required this.version,
    required this.capacity,
    required this.rangeKm,
    required this.ean,
    required this.kmPerKwh,
  });

  @override
  List<Object?> get props => [
        id,
        model,
        version,
        capacity,
        rangeKm,
        ean,
        kmPerKwh,
      ];
}
