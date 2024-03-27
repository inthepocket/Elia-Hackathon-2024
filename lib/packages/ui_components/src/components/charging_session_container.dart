import 'package:flutter/material.dart';

class ChargingSessionContainer extends StatelessWidget {
  final Widget child;

  const ChargingSessionContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
