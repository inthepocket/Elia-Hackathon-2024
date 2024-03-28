import 'package:elia_hackathon_2024_app/packages/ui_components/ui_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../shared.dart';

SliverWoltModalSheetPage requestDepartureTimePage({
  required BuildContext modalSheetContext,
  required DateTime initialDepartureTime,
  required void Function(DateTime) onDepartureTimeSelected,
  required VoidCallback onNextPressed,
}) {
  return WoltModalSheetPage(
    hasTopBarLayer: false,
    surfaceTintColor: Colors.white,
    child: Padding(
      padding: const EdgeInsets.only(bottom: SpacingTokens.ml),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SpacingTokens.ml),
          child: Column(
            children: [
              const SizedBox(height: SpacingTokens.l),
              const ModalTitle(text: 'When are you leaving?'),
              const SizedBox(height: SpacingTokens.s),
              SizedBox(
                height: 178.0,
                width: double.infinity,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: initialDepartureTime,
                  use24hFormat: true,
                  onDateTimeChanged: onDepartureTimeSelected,
                ),
              ),
              const SizedBox(height: SpacingTokens.m),
              PrimaryButton(
                text: 'Next',
                onPressed: onNextPressed,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
