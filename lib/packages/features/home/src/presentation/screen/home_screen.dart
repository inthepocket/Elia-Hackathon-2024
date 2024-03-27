import 'package:elia_hackathon_2024_app/packages/ui_components/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

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
          const _ChargingSessionsSection(),
        ],
      ),
    );
  }
}

class _ChargingSessionsSection extends StatelessWidget {
  const _ChargingSessionsSection();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      left: false,
      top: false,
      right: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(12.0, 32.0, 12.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Session history',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12.0),
            _ChargingSessions(),
          ],
        ),
      ),
    );
  }
}

class _ChargingSessions extends StatelessWidget {
  const _ChargingSessions();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ChargingSessionContainer(
          child: ChargingSessionBody(
            startTime: '17:00',
            endTime: '18:00',
            kmBeforeCharging: 100.0,
            kmAfterCharing: 150.0,
            maxKm: 400.0,
            amountSaved: '5,00',
            currencySymbol: '€',
          ),
        ),
        SizedBox(height: 6.0),
        ChargingSessionContainer(
          child: ChargingSessionBody(
            startTime: '17:00',
            endTime: '18:00',
            kmBeforeCharging: 100.0,
            kmAfterCharing: 150.0,
            maxKm: 400.0,
            amountSaved: '5,00',
            currencySymbol: '€',
          ),
        ),
        SizedBox(height: 6.0),
        ChargingSessionContainer(
          child: ChargingSessionBody(
            startTime: '17:00',
            endTime: '18:00',
            kmBeforeCharging: 100.0,
            kmAfterCharing: 150.0,
            maxKm: 400.0,
            amountSaved: '5,00',
            currencySymbol: '€',
          ),
        ),
        SizedBox(height: 6.0),
        ChargingSessionContainer(
          child: ChargingSessionBody(
            startTime: '17:00',
            endTime: '18:00',
            kmBeforeCharging: 100.0,
            kmAfterCharing: 150.0,
            maxKm: 400.0,
            amountSaved: '5,00',
            currencySymbol: '€',
          ),
        ),
        SizedBox(height: 6.0),
        ChargingSessionContainer(
          child: ChargingSessionBody(
            startTime: '17:00',
            endTime: '18:00',
            kmBeforeCharging: 100.0,
            kmAfterCharing: 150.0,
            maxKm: 400.0,
            amountSaved: '5,00',
            currencySymbol: '€',
          ),
        ),
        SizedBox(height: 6.0),
        ChargingSessionContainer(
          child: ChargingSessionBody(
            startTime: '17:00',
            endTime: '18:00',
            kmBeforeCharging: 100.0,
            kmAfterCharing: 150.0,
            maxKm: 400.0,
            amountSaved: '5,00',
            currencySymbol: '€',
          ),
        ),
        SizedBox(height: 6.0),
        ChargingSessionContainer(
          child: ChargingSessionBody(
            startTime: '17:00',
            endTime: '18:00',
            kmBeforeCharging: 100.0,
            kmAfterCharing: 150.0,
            maxKm: 400.0,
            amountSaved: '5,00',
            currencySymbol: '€',
          ),
        ),
        SizedBox(height: 6.0),
        ChargingSessionContainer(
          child: ChargingSessionBody(
            startTime: '17:00',
            endTime: '18:00',
            kmBeforeCharging: 100.0,
            kmAfterCharing: 150.0,
            maxKm: 400.0,
            amountSaved: '5,00',
            currencySymbol: '€',
          ),
        ),
        SizedBox(height: 6.0),
        ChargingSessionContainer(
          child: ChargingSessionBody(
            startTime: '17:00',
            endTime: '18:00',
            kmBeforeCharging: 100.0,
            kmAfterCharing: 150.0,
            maxKm: 400.0,
            amountSaved: '5,00',
            currencySymbol: '€',
          ),
        ),
        SizedBox(height: 6.0),
        ChargingSessionContainer(
          child: ChargingSessionBody(
            startTime: '17:00',
            endTime: '18:00',
            kmBeforeCharging: 100.0,
            kmAfterCharing: 150.0,
            maxKm: 400.0,
            amountSaved: '5,00',
            currencySymbol: '€',
          ),
        ),
        SizedBox(height: 6.0),
        ChargingSessionContainer(
          child: ChargingSessionBody(
            startTime: '17:00',
            endTime: '18:00',
            kmBeforeCharging: 100.0,
            kmAfterCharing: 150.0,
            maxKm: 400.0,
            amountSaved: '5,00',
            currencySymbol: '€',
          ),
        ),
      ],
    );
  }
}
