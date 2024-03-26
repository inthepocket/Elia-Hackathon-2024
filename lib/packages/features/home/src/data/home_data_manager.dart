import '../domain/entities/charging_session.dart';
import '../domain/extensions/charging_session_extensions.dart';
import '../domain/home_data_manager.dart';
import 'api/home_api_provider.dart';

class HomeDataManagerImpl implements HomeDataManager {
  HomeDataManagerImpl(
    this._homeApiProvider,
  );

  final HomeApiProvider _homeApiProvider;

  @override
  Future<List<ChargingSession>> getChargingSessions({required String ean, required String realTime}) async {
    final models = await _homeApiProvider.getChargingSessions(ean: ean, realTime: realTime);
    return models.map((model) => model.toEntity()).toList();
  }
}
