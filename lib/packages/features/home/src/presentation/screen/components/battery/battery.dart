import 'package:elia_hackathon_2024_app/packages/ui_components/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../domain/entities/charging_session_state.dart';

class Battery extends StatelessWidget {
  final ChargingSessionState currentState;
  final ChargingSessionState startState;

  const Battery({
    super.key,
    required this.currentState,
    required this.startState,
  });

  @override
  Widget build(BuildContext context) {
    final fullBattery = startState.socMax.round();
    final startBattery = startState.soc.round();
    final currentHappyHourBattery = currentState.soc.round() - startBattery;
    final expectedHappyHourBattery = fullBattery - startBattery;

    return Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: 32.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(4.0),
              ),
              border: Border.all(
                color: const Color(0xFFDEDBDB),
              ),
            ),
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: startBattery,
                  child: const _StartBatteryState(),
                ),
                const SizedBox(width: 2.0),
                Expanded(
                  flex: expectedHappyHourBattery,
                  child: _ExpectedHappyHourBatteryState(
                    currentHappyHourBattery: currentHappyHourBattery,
                    expectedHappyHourBattery: expectedHappyHourBattery,
                  ),
                ),
              ],
            ),
          ),
        ),
        const _Nipple(),
      ],
    );
  }
}

class _StartBatteryState extends StatelessWidget {
  const _StartBatteryState();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFBAC1C4),
      ),
    );
  }
}

class _ExpectedHappyHourBatteryState extends StatelessWidget {
  final int currentHappyHourBattery;
  final int expectedHappyHourBattery;

  const _ExpectedHappyHourBatteryState({
    required this.currentHappyHourBattery,
    required this.expectedHappyHourBattery,
  });

  @override
  Widget build(BuildContext context) {
    final happyHourBatteryPercentage = currentHappyHourBattery / expectedHappyHourBattery;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xFFE2F0E2),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth * happyHourBatteryPercentage,
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFF3C9C41),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _Nipple extends ConsumerWidget {
  const _Nipple();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetsProvider = ref.read(assetsProviderProvider);

    return SvgPicture.asset(assetsProvider.batteryNipple);
  }
}
