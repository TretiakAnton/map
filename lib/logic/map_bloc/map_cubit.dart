import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  ///default mocked position
  LatLng _gpsLocation = const LatLng(50.450001, 30.523333);

  LatLng get gpsLocation => _gpsLocation;

  Future<void> updateGpsLocation() async {
    final currentLocation = await Geolocator.getCurrentPosition();
    _gpsLocation = LatLng(currentLocation.latitude, currentLocation.longitude);
  }
}
