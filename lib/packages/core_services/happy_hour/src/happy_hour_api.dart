import 'package:dio/dio.dart';
import 'package:elia_hackathon_2024_app/packages/features/home/home.dart';
import 'package:retrofit/retrofit.dart';

part 'happy_hour_api.g.dart';

@RestApi()
abstract class HappyHourRestClient {
  factory HappyHourRestClient(Dio dio, {String baseUrl}) = _HappyHourRestClient;

  @GET('/sessions')
  Future<List<ChargingSessionModel>> getChargingSessions({
    @Query('ean') required String ean,
    @Query('realTime') required String realTime,
  });

  @GET('/vehicles')
  Future<List<VehicleModel>> getVehicles();

  @GET('/vehicles')
  Future<VehicleStateModel> getVehicleState({
    @Query('ean') required String ean,
  });
}
