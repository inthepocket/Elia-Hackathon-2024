import 'entities/charging_session.dart';

abstract class HomeDataManager {
  Future<List<ChargingSession>> getChargingSessions({
    required String ean,
    required String realTime,
  });
}
