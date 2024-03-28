import 'package:elia_hackathon_2024_app/packages/core_services/date_formatter/date_formatter.dart';
import 'package:elia_hackathon_2024_app/packages/ui_components/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intersperse/intersperse.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../domain/entities/charging_session.dart';
import '../home_viewmodel.dart';
import '../di/pods.dart';
import '../models/home_screen_state.dart';
import 'components/charging_session_request/widgets/request_departure_time_page.dart';
import 'components/charging_session_request/widgets/request_desired_range.dart';
import 'components/profile_section.dart';

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
      backgroundColor: const Color(0xFF1F1F27),
      body: const _BodyBuilder(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFE75420),
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
        child: const Icon(
          Icons.drive_eta,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _BodyBuilder extends ConsumerWidget {
  const _BodyBuilder();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(homeViewModelProvider);

    return ValueListenableBuilder(
      valueListenable: vm,
      builder: (context, state, widget) {
        return switch (state) {
          HomeScreenLoading() => const _LoadingBody(),
          HomeScreenError() => const _ErrorBody(),
          HomeScreenData() => _DataBody(data: state),
        };
      },
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('An error occurred while fetching the data.'),
    );
  }
}

class _DataBody extends StatelessWidget {
  final HomeScreenData data;

  const _DataBody({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          ProfileSection(data: data),
          _ChargingSessionsSection(data: data),
        ],
      ),
    );
  }
}

class _ChargingSessionsSection extends StatelessWidget {
  final HomeScreenData data;

  const _ChargingSessionsSection({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      top: false,
      right: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 32.0, 12.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Session history',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12.0),
            _ChargingSessions(
              mostRecentSessions: data.selectedVehicleState.mostRecentSessions,
            ),
          ],
        ),
      ),
    );
  }
}

class _ChargingSessions extends ConsumerWidget {
  final List<ChargingSession> mostRecentSessions;

  const _ChargingSessions({
    required this.mostRecentSessions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateFormatter = ref.watch(dateFormatterProvider);

    final chargingSessions = mostRecentSessions
        .where((session) => session.endState != null)
        .map<Widget>(
          (session) => ChargingSessionContainer(
            child: ChargingSessionBody(
              startTime: dateFormatter.formatTime(session.startState.stateTime),
              endTime: dateFormatter.formatTime(session.endState!.stateTime),
              kmBeforeCharging: session.startState.soc,
              kmAfterCharing: session.endState!.soc,
              maxKm: session.startState.socMax,
              amountSaved: '5,00',
              currencySymbol: '€',
            ),
          ),
        )
        .intersperse(const SizedBox(height: 6.0))
        .toList();

    return Column(children: chargingSessions);
  }
}
