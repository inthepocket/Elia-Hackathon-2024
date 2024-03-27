import 'package:elia_hackathon_2024_app/packages/ui_components/ui_components.dart';

import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../../../domain/entities/vehicle.dart';
import '../../shared.dart';

SliverWoltModalSheetPage selectCarPage({
  required BuildContext modalSheetContext,
  required List<Vehicle> vehicles,
  required Vehicle initialVehicle,
  required void Function(Vehicle?) onVehicleSelected,
}) {
  final radioListTiles = vehicles.map((vehicle) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 24.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            vehicle.model,
            style: const TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Radio<Vehicle>(
            groupValue: initialVehicle,
            value: vehicle,
            onChanged: onVehicleSelected,
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return const Color(0xFFE75420);
              }

              return null;
            }),
          ),
        ],
      ),
    );
  }).toList();

  return WoltModalSheetPage(
    hasTopBarLayer: false,
    backgroundColor: Colors.white,
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SpacingTokens.ml),
        child: Column(
          children: [
            const SizedBox(height: SpacingTokens.l),
            const ModalTitle(text: 'Choose a vehicle'),
            const SizedBox(height: SpacingTokens.s),
            ...radioListTiles,
            const SizedBox(height: SpacingTokens.ml),
          ],
        ),
      ),
    ),
  );
}
