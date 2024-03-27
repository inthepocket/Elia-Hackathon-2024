import 'package:elia_hackathon_2024_app/packages/ui_components/ui_components.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xFF2B2B35),
      ),
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Container(
          height: 200.0,
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
          margin: const EdgeInsets.symmetric(
            horizontal: SpacingTokens.l,
            vertical: SpacingTokens.ml,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingTokens.ml,
            vertical: SpacingTokens.m,
          ),
          child: SizedBox.expand(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Reward',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: PrimitiveColorTokens.gray200,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: '27,03 ',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: PrimitiveColorTokens.gray900,
                    ),
                    children: [
                      TextSpan(
                        text: 'Euro'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: PrimitiveColorTokens.gray900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
