import 'dart:async';

import 'package:flutter/material.dart';

import '../tokens/spacing_tokens.dart';

typedef FutureOrVoidCallback = FutureOr<void> Function();

class PrimaryButton extends StatelessWidget {
  final String text;
  final FutureOrVoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(const Color(0xFFE75420)),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: SpacingTokens.m)),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48.0),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 0),
        ),
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
