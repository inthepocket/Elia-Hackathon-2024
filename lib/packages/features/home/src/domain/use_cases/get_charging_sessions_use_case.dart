import '../entities/charging_session.dart';
import '../home_data_manager.dart';

abstract class GetChargingSessionsUseCase {
  Future<List<ChargingSession>> call({
    required String ean,
    required String realTime,
  });
}

class GetChargingSessionsUseCaseImpl implements GetChargingSessionsUseCase {
  GetChargingSessionsUseCaseImpl(
    this._homeDataManager,
  );

  final HomeDataManager _homeDataManager;

  @override
  Future<List<ChargingSession>> call({
    required String ean,
    required String realTime,
  }) {
    return _homeDataManager.getChargingSessions(
      ean: ean,
      realTime: realTime,
    );
  }
}
