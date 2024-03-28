import 'package:elia_hackathon_2024_app/packages/core_services/date_formatter/date_formatter.dart';
import 'package:elia_hackathon_2024_app/packages/ui_components/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../domain/entities/vehicle.dart';
import '../../../domain/entities/vehicle_state.dart';
import '../../di/pods.dart';
import '../../models/home_screen_state.dart';
import '../../extensions/vehicle_extensions.dart';
import 'battery/battery.dart';
import 'select_car/widgets/select_vehicle_page.dart';

class ProfileSection extends ConsumerWidget {
  final HomeScreenData data;

  const ProfileSection({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRangeKm =
        (data.selectedVehicleState.currentState.soc * data.selectedVehicleState.metaData.kmPerKwh).round();

    final currentRangePercentage = (currentRangeKm / data.selectedVehicleState.metaData.rangeKm * 100).round();

    final currentRangeText = data.selectedVehicleState.currentState.connected ? 'Current range' : 'Last known range';

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xFF2B2B35),
      ),
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            WoltModalSheet.show<void>(
                              context: context,
                              modalTypeBuilder: (_) => WoltModalType.bottomSheet,
                              pageListBuilder: (modalSheetContext) => [
                                selectCarPage(
                                  modalSheetContext: modalSheetContext,
                                  vehicles: data.vehicles,
                                  initialVehicle: data.selectedVehicleState.metaData,
                                  onVehicleSelected: (Vehicle? vehicle) {
                                    if (vehicle != null) {
                                      final vm = ref.read(homeViewModelProvider);
                                      vm.onVehicleSelected(vehicle);
                                      Navigator.of(context).pop();
                                    }
                                  },
                                ),
                              ],
                              onModalDismissedWithBarrierTap: Navigator.of(context).pop,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                data.selectedVehicleState.metaData.model,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const RotatedBox(
                                quarterTurns: 1,
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: data.selectedVehicleState.metaData.reward.toStringAsFixed(2).replaceAll('.', ','),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                            children: const [
                              TextSpan(
                                text: ' €',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text.rich(
                      TextSpan(
                        text: '$currentRangeText $currentRangePercentage',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          const TextSpan(
                            text: '%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' - $currentRangeKm',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                            children: const [
                              TextSpan(
                                text: ' km',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12.0),
              _ProfileCard(data: data),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends ConsumerWidget {
  final HomeScreenData data;

  const _ProfileCard({
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetsProvider = ref.watch(assetsProviderProvider);
    final dateFormatter = ref.watch(dateFormatterProvider);

    final sessions = data.selectedVehicleState.mostRecentSessions;
    sessions.sort((a, b) => b.startState.stateTime.compareTo(a.startState.stateTime));
    final mostRecentSession = sessions.firstOrNull;

    final Text sessionStartTime;
    if (mostRecentSession == null) {
      sessionStartTime = const Text(
        'No session',
        style: TextStyle(
          color: Color(0xFF576C76),
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
      );
    } else {
      final stateTime = mostRecentSession.startState.stateTime;
      final endState = mostRecentSession.endState;

      sessionStartTime = data.selectedVehicleState.currentState.connected
          ? Text.rich(
              TextSpan(
                text: dateFormatter.formatTime(stateTime),
                style: const TextStyle(
                  color: Color(0xFF576C76),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
                children: endState == null
                    ? const [
                        TextSpan(
                          text: ' - Now',
                          style: TextStyle(
                            color: Color(0xFF576C76),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ]
                    : [],
              ),
            )
          : const Text(
              'Enjoy your ride',
              style: TextStyle(
                color: Color(0xFF576C76),
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            );
    }

    return Container(
      decoration: const BoxDecoration(
        color: PrimitiveColorTokens.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0000002E),
            offset: Offset(0.0, 8.84000015258789),
            blurRadius: 19.270000457763672,
            spreadRadius: -3.0,
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: SpacingTokens.ml),
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingTokens.m,
        vertical: SpacingTokens.sm,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                data.selectedVehicleState.metaData.getImage(assetsProvider),
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sessionStartTime,
                _StateChip(selectedVehicleState: data.selectedVehicleState),
              ],
            ),
            if (mostRecentSession != null) ...[
              const SizedBox(height: 12.0),
              Battery(
                currentState: data.selectedVehicleState.currentState,
                startState: mostRecentSession.startState,
              ),
              const SizedBox(height: 8.0),
            ],
            const Text.rich(
              TextSpan(
                text: 'Estimated full charge time at ',
                style: TextStyle(
                  color: Color(0xFF576C76),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: '13:25',
                    style: TextStyle(
                      color: Color(0xFF576C76),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StateChip extends ConsumerWidget {
  final VehicleState selectedVehicleState;

  const _StateChip({
    required this.selectedVehicleState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetsProvider = ref.watch(assetsProviderProvider);

    final String iconName;
    final String text;
    final Color foregroundColor;
    final Color backgroundColor;

    if (selectedVehicleState.currentState.connected && selectedVehicleState.currentState.consumption > 0) {
      iconName = assetsProvider.iconPig;
      text = 'Happy hour';
      foregroundColor = const Color(0xFF3C9C41);
      backgroundColor = const Color(0xFFE2F0E2);
    } else if (selectedVehicleState.currentState.connected && selectedVehicleState.currentState.consumption == 0) {
      iconName = assetsProvider.iconPlug;
      text = 'Plugged in';
      foregroundColor = const Color(0xFFF39642);
      backgroundColor = const Color(0xFFFDEFE2);
    } else {
      iconName = assetsProvider.iconUnplugged;
      text = 'Unplugged';
      foregroundColor = const Color(0xFF617177);
      backgroundColor = const Color(0xFFF5F6F7);
    }

    return EliaChip(
      iconName: iconName,
      text: text,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
    );
  }
}
