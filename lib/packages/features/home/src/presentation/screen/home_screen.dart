import 'package:elia_hackathon_2024_app/packages/ui_components/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../home_viewmodel.dart';
import '../di/pods.dart';
import 'components/charging_session_request/widgets/request_departure_time_page.dart';
import 'components/charging_session_request/widgets/request_desired_range.dart';
import 'components/profile_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    final vm = ref.read<HomeViewModel>(homeViewModelProvider);
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimitiveColorTokens.gray400,
      body: const _Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final vm = ref.read<HomeViewModel>(homeViewModelProvider);

          final chargingSessionRequestVM = ref.read(
            chargingSessionRequestViewModelProvider(
              initialDepartureTime: DateTime(1, 1, 1, 17, 0),
              initialRange: 75.0,
              maxRange: 400.0,
            ),
          );

          WoltModalSheet.show<void>(
            context: context,
            pageIndexNotifier: chargingSessionRequestVM,
            modalTypeBuilder: (_) => WoltModalType.bottomSheet,
            pageListBuilder: (modalSheetContext) => [
              requestDepartureTimePage(
                modalSheetContext: modalSheetContext,
                initialDepartureTime: chargingSessionRequestVM.initialDepartureTime,
                onDepartureTimeSelected: (DateTime departureTime) =>
                    chargingSessionRequestVM.onDepartureTimeSelected(departureTime),
                onNextPressed: chargingSessionRequestVM.onNextPressed,
              ),
              requestDesiredRange(
                modalSheetContext: modalSheetContext,
                initialRange: chargingSessionRequestVM.initialRange,
                maxRange: chargingSessionRequestVM.maxRange,
                onBackPressed: chargingSessionRequestVM.onBackPressed,
                onDesiredRangeSelected: chargingSessionRequestVM.onDesiredRangeSelected,
                onNextPressed: () {
                  vm.onChargingSessionRequested(
                    departureTime: chargingSessionRequestVM.departureTime,
                    desiredRange: chargingSessionRequestVM.desiredRange,
                  );

                  Navigator.of(context).pop();
                },
              ),
            ],
            onModalDismissedWithBarrierTap: Navigator.of(context).pop,
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileCard(),
            _ChargingSessionsSection(),
          ],
        ),
      ),
    );
  }
}

class _ChargingSessionsSection extends StatelessWidget {
  const _ChargingSessionsSection();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
