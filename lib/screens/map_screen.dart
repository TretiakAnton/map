import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map/logic/map_bloc/map_cubit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final CameraPosition initialPosition;
  Set<Marker> _markers = {};

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MapCubit>();
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: false,
        zoomGesturesEnabled: true,
        rotateGesturesEnabled: false,
        compassEnabled: false,
        myLocationButtonEnabled: false,
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            bloc.gpsLocation.latitude,
            bloc.gpsLocation.longitude,
          ),
          zoom: 12,
        ),
        markers: _markers,
      ),
    );
  }
}
