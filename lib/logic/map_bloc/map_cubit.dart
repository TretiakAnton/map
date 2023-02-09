import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  ///default mocked position
  LatLng _gpsLocation = const LatLng(50.450001, 30.523333);
  CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(
      50.450001,
      30.523333,
    ),
    zoom: 11,
  );

  LatLng get gpsLocation => _gpsLocation;

  CameraPosition get initialPosition => _initialPosition;

  Future<void> updateGpsLocation() async {
    final currentLocation = await Geolocator.getCurrentPosition();
    _gpsLocation = LatLng(currentLocation.latitude, currentLocation.longitude);
    await updatePosition();
    emit(MapUpdates());
  }

  Future<void> updatePosition() async {
    _initialPosition = CameraPosition(
        target: LatLng(
          _gpsLocation.latitude,
          _gpsLocation.longitude,
        ),
        zoom: 16);
    emit(MapUpdates());
  }
}
