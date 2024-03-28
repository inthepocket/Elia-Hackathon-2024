import 'package:elia_hackathon_2024_app/packages/ui_components/ui_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../shared.dart';

SliverWoltModalSheetPage requestDesiredRange({
  required BuildContext modalSheetContext,
  required double initialRange,
  required double maxRange,
  required VoidCallback onBackPressed,
  required void Function(double desiredRange) onDesiredRangeSelected,
  required VoidCallback onNextPressed,
}) {
  final rangeSliderValue = ValueNotifier<double>(initialRange);

  return WoltModalSheetPage(
    hasTopBarLayer: false,
    surfaceTintColor: Colors.white,
    child: Padding(
      padding: const EdgeInsets.only(bottom: SpacingTokens.ml),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: SpacingTokens.l),
            Row(
              children: [
                const SizedBox(width: 4.0),
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: onBackPressed,
                ),
                const SizedBox(height: SpacingTokens.sm),
                const Expanded(
                  child: Center(
                    child: ModalTitle(
                      text: 'How far will you be driving?',
                    ),
                  ),
                ),
                const SizedBox(height: SpacingTokens.sm),
                const SizedBox(width: 44.0),
              ],
            ),
            const SizedBox(height: SpacingTokens.s),
            ValueListenableBuilder(
              valueListenable: rangeSliderValue,
              builder: (context, value, child) {
                final isRangeUpdated = value != initialRange;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: SpacingTokens.ml),
                      child: Text.rich(
                        TextSpan(
                          text: '${value.round()} ',
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF26262B),
                          ),
                          children: const [
                            TextSpan(
                              text: 'km',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFA0A6AD),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: SpacingTokens.ml),
                      child: Text(
                        isRangeUpdated ? 'New range' : 'Current range',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: isRangeUpdated ? const Color(0xFFE75420) : const Color(0xFFA0A6AD),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: SpacingTokens.l),
                      child: SizedBox(
                        width: double.infinity,
                        child: CupertinoSlider(
                          value: value,
                          min: initialRange,
                          max: maxRange,
                          activeColor: const Color(0xFFE75420),
                          onChanged: (value) => rangeSliderValue.value = value,
                          onChangeEnd: onDesiredRangeSelected,
                        ),
                      ),
                    ),
                    const SizedBox(height: SpacingTokens.m),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: SpacingTokens.ml),
                      child: PrimaryButton(
                        text: isRangeUpdated ? 'Set desired range' : 'This is fine',
                        onPressed: onNextPressed,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
