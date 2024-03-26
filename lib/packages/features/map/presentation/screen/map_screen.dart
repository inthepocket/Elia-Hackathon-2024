import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';

const _quartierPapierCoordinates = LatLng(50.88799690783698, 4.461555099539066);

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: MapController(),
        options: const MapOptions(
          initialCenter: _quartierPapierCoordinates,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.inthepocket.eliaHackathon2024App',
          ),
          CurrentLocationLayer(
            alignPositionOnUpdate: AlignOnUpdate.always,
          ),
        ],
      ),
    );
  }
}
