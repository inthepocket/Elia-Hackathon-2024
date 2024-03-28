import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'elia_chip.dart';

class ChargingSessionBody extends ConsumerWidget {
  final String startTime;
  final String endTime;
  final double kmBeforeCharging;
  final double kmAfterCharing;
  final double maxKm;
  final String amountSaved;
  final String currencySymbol;
  final String? trivia;

  const ChargingSessionBody({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.kmBeforeCharging,
    required this.kmAfterCharing,
    required this.maxKm,
    required this.amountSaved,
    required this.currencySymbol,
    this.trivia,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _SessionPeriod(
              startTime: startTime,
              endTime: endTime,
            ),
            EliaChip(
              text: '$amountSaved $currencySymbol',
              backgroundColor: const Color(0xFFE2F0E2),
              foregroundColor: const Color(0xFF3C9C41),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        _ChargingState(
          kmBeforeCharging: kmBeforeCharging,
          kmAfterCharing: kmAfterCharing,
          maxKm: maxKm,
        ),
        if (trivia != null) ...[
          const SizedBox(height: 8.0),
          _Trivia(trivia: trivia!),
        ],
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
    return Text.rich(
      TextSpan(
        text: startTime,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF576C76),
        ),
        children: [
          TextSpan(
            text: ' - $endTime',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF576C76),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChargingState extends StatelessWidget {
  final double kmBeforeCharging;
  final double kmAfterCharing;
  final double maxKm;

  const _ChargingState({
    required this.kmBeforeCharging,
    required this.kmAfterCharing,
    required this.maxKm,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.0,
      width: double.infinity,
      child: CustomPaint(
        painter: _ChargingStatePainter(
          kmBeforeCharging: kmBeforeCharging,
          kmAfterCharing: kmAfterCharing,
          maxKm: maxKm,
        ),
      ),
    );
  }
}

class _ChargingStatePainter extends CustomPainter {
  final double kmBeforeCharging;
  final double kmAfterCharing;
  final double maxKm;

  const _ChargingStatePainter({
    required this.kmBeforeCharging,
    required this.kmAfterCharing,
    required this.maxKm,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF8B8B8B)
      ..strokeWidth = 4.0;

    const lineStart = Offset(0.0, 0.0);

    final maxKmEnd = Offset(size.width, 0.0);
    canvas.drawLine(lineStart, maxKmEnd, paint);

    final kmAfterChargingEnd = Offset(size.width * (kmAfterCharing / maxKm), 0.0);
    paint.color = const Color(0xFF53C37B);
    canvas.drawLine(lineStart, kmAfterChargingEnd, paint);

    final kmBeforeChargingEnd = Offset(size.width * (kmBeforeCharging / maxKm), 0.0);
    paint.color = const Color(0xFFB7B7B7);
    canvas.drawLine(lineStart, kmBeforeChargingEnd, paint);
  }

  @override
  bool shouldRepaint(_ChargingStatePainter oldDelegate) => true;
}

class _Trivia extends StatelessWidget {
  final String trivia;

  const _Trivia({
    required this.trivia,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      trivia,
      style: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: Color(0xFF576C76),
      ),
    );
  }
}
