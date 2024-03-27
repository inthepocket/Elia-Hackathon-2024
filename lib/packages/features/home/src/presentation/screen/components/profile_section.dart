import 'package:elia_hackathon_2024_app/packages/ui_components/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFF2B2B35),
      ),
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Volvo EX30',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: '27,03',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
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
                        text: 'Current range 75',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: '%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' - 130',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
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
              SizedBox(height: 12.0),
              _ProfileCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends ConsumerWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetsProvider = ref.watch(assetsProviderProvider);

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
        horizontal: SpacingTokens.ml,
        vertical: SpacingTokens.m,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              assetsProvider.imageVolvoEx30,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: '08:32',
                        style: TextStyle(
                          color: Color(0xFF576C76),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: ' - Now',
                            style: TextStyle(
                              color: Color(0xFF576C76),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                EliaChip(
                  iconName: assetsProvider.iconRecharging,
                  text: 'Direct charging',
                  backgroundColor: const Color(0xFFE4F0F2),
                  foregroundColor: const Color(0xFF4B9EAA),
                ),
              ],
            ),
            const Text.rich(
              TextSpan(
                text: 'Estimated time at ',
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
