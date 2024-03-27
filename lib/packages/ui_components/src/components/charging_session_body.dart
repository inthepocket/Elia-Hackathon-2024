import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../di/pods.dart';

class ChargingSessionBody extends StatelessWidget {
  final String startTime;
  final String endTime;
  final double kmBeforeCharging;
  final double kmAfterCharing;
  final double maxKm;
  final String amountSaved;
  final String currencySymbol;

  const ChargingSessionBody({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.kmBeforeCharging,
    required this.kmAfterCharing,
    required this.maxKm,
    required this.amountSaved,
    required this.currencySymbol,
  });

  @override
  Widget build(BuildContext context) {
    final chargedPercentage = (kmAfterCharing - kmBeforeCharging) / maxKm * 100;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SessionPeriod(
          startTime: startTime,
          endTime: endTime,
        ),
        const SizedBox(height: 8.0),
        const _ChargingState(),
        const SizedBox(height: 8.0),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ChargedChip(
              chargedPercentage: chargedPercentage,
            ),
            _AmountSaved(
              amountSaved: amountSaved,
              currencySymbol: currencySymbol,
            ),
          ],
        ),
      ],
    );
  }
}

class _SessionPeriod extends StatelessWidget {
  final String startTime;
  final String endTime;

  const _SessionPeriod({
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$startTime - $endTime',
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _ChargingState extends StatelessWidget {
  const _ChargingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 4.0,
      width: double.infinity,
      child: CustomPaint(
        painter: _ChargingStatePainter(),
      ),
    );
  }
}

class _ChargingStatePainter extends CustomPainter {
  const _ChargingStatePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF8B8B8B)
      ..strokeWidth = 2.0;

    const lineStart = Offset(0.0, 0.0);

    final maxKmEnd = Offset(size.width, 0.0);
    canvas.drawLine(lineStart, maxKmEnd, paint);

    final kmAfterChargingEnd = Offset(size.width * 0.6, 0.0);
    paint.strokeWidth = 4.0;
    paint.color = const Color(0xFF53C37B);
    canvas.drawLine(lineStart, kmAfterChargingEnd, paint);

    final kmBeforeChargingEnd = Offset(size.width * 0.3, 0.0);
    paint.color = const Color(0xFFB7B7B7);
    canvas.drawLine(lineStart, kmBeforeChargingEnd, paint);
  }

  @override
  bool shouldRepaint(_ChargingStatePainter oldDelegate) => true;
}

class _ChargedChip extends ConsumerWidget {
  final double chargedPercentage;

  const _ChargedChip({
    required this.chargedPercentage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetsProvider = ref.watch(assetsProviderProvider);

    return Container(
      padding: const EdgeInsets.fromLTRB(4.0, 2.0, 6.0, 2.0),
      decoration: BoxDecoration(
        color: const Color(0xFFE2F0E2),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            assetsProvider.iconBolt,
            colorFilter: const ColorFilter.mode(
              Color(0xFF3C9C41),
              BlendMode.dstIn,
            ),
          ),
          const SizedBox(width: 2.0),
          Text(
            '+${chargedPercentage.round()}%',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3C9C41),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmountSaved extends StatelessWidget {
  final String amountSaved;
  final String currencySymbol;

  const _AmountSaved({
    required this.amountSaved,
    required this.currencySymbol,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$amountSaved ',
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: currencySymbol,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}