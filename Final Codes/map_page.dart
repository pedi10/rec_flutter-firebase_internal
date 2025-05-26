import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // Google Maps controller
  late GoogleMapController mapController;

  // Initial camera position centered on Kuala Lumpur
  static const CameraPosition _kualaLumpur = CameraPosition(
    target: LatLng(3.139, 101.6869), // KL coordinates
    zoom: 12.0,
  );

  // Set of markers with locations in KL
  final Set<Marker> _markers = {
    // KLCC area with custom red marker
    Marker(
      markerId: const MarkerId('klcc'),
      position: const LatLng(3.1578, 101.7123),
      infoWindow: const InfoWindow(title: 'KLCC Mission'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    // Mid Valley area with custom blue marker
    Marker(
      markerId: const MarkerId('midvalley'),
      position: const LatLng(3.1184, 101.6764),
      infoWindow: const InfoWindow(title: 'Mid Valley Mission'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    // Bukit Bintang area with custom green marker
    Marker(
      markerId: const MarkerId('bukitbintang'),
      position: const LatLng(3.1478, 101.7108),
      infoWindow: const InfoWindow(title: 'Bukit Bintang Mission'),
    ),
  };

  // Called when the map is ready
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Robot Locations')),
      body: Container(
        margin: const EdgeInsets.all(25.0), // 25px padding around the map
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), // Rounded corners
          color: Theme.of(context).cardColor, // Use card color from theme
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            20.0,
          ), // Match container's border radius
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: _kualaLumpur,
            markers: _markers,
            compassEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            minMaxZoomPreference: const MinMaxZoomPreference(10.0, 20.0),
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            tiltGesturesEnabled: true,
          ),
        ),
      ),
    );
  }
}
