import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map/logic/map_bloc/map_cubit.dart';
import 'package:map/screens/side_menu.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  Set<Marker> _markers = {};

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MapCubit>();
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
          //automaticallyImplyLeading: false,
          ),
      body: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          return GoogleMap(
            myLocationEnabled: false,
            zoomGesturesEnabled: true,
            rotateGesturesEnabled: false,
            compassEnabled: false,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: bloc.initialPosition,
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
              });
            },
            //markers: _markers,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mapController?.animateCamera(
              CameraUpdate.newCameraPosition(bloc.initialPosition));
        },
        child: const Icon(Icons.location_searching),
      ),
    );
  }
}
