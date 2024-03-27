import 'package:flutter/material.dart';

class ModalTitle extends StatelessWidget {
  final String text;

  const ModalTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xFF43484D),
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      ),
    );
  }
}
