import 'package:elia_hackathon_2024_app/packages/ui_components/ui_components.dart';

import '../../domain/entities/vehicle.dart';

extension VehicleX on Vehicle {
  String getImage(AssetsProvider assetsProvider) {
    return switch (model) {
      'Volvo EX30' => assetsProvider.imageVolvoEx30,
      'Volvo EX40' => assetsProvider.imageVolvoEx40,
      'Polestar 2' => assetsProvider.imagePolestar2,
      _ => throw ArgumentError.value(model, 'model', 'Invalid model'),
    };
  }
}
