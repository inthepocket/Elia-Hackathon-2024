import 'package:elia_hackathon_2024_app/packages/ui_components/ui_components.dart';

import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:intersperse/intersperse.dart';

import '../../../../../domain/entities/vehicle.dart';

SliverWoltModalSheetPage selectCarPage({
  required BuildContext modalSheetContext,
  required List<Vehicle> vehicles,
  required Vehicle initialVehicle,
  required void Function(Vehicle?) onVehicleSelected,
}) {
  final tiles = vehicles
      .map<Widget>((vehicle) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicle.model,
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text.rich(
                  TextSpan(
                    text: 'EAN ',
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF5D6173),
                    ),
                    children: [
                      TextSpan(
                        text: vehicle.ean,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF5D6173),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
        );
      })
      .intersperse(const SizedBox(height: 24.0))
      .toList();

  return WoltModalSheetPage(
    hasTopBarLayer: false,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(
        SpacingTokens.ml,
        SpacingTokens.l,
        SpacingTokens.ml,
        SpacingTokens.ml,
      ),
      child: SafeArea(
        child: Column(children: tiles),
      ),
    ),
  );
}
