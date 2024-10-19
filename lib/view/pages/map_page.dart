// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';

// class MapApp extends StatefulWidget {
//   const MapApp({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _MapAppState createState() => _MapAppState();
// }

// class _MapAppState extends State<MapApp> {
//   late GoogleMapController myController;
//   final LatLng _center = const LatLng(45.521563, -122.677433);

//   void _onMapCreated(GoogleMapController controller) {
//     myController = controller;
//   }

//   Future<void> checkPermissions() async {
//     var status = await Permission.location.status;
//     if (!status.isGranted) {
//       await Permission.location.request();
//     }
//   }

//   @override
//   void initState() {
//     checkPermissions();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter Maps '),
//           backgroundColor: Colors.green,
//         ),
//         body: Stack(
//           children: <Widget>[
//             GoogleMap(
//               myLocationButtonEnabled: true,
//               myLocationEnabled: true,
//               onMapCreated: _onMapCreated,
//               initialCameraPosition: CameraPosition(
//                 target: _center,
//                 zoom: 15.0,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(14.0),
//               child: Align(
//                 alignment: Alignment.topRight,
//                 child: FloatingActionButton(
//                   onPressed: () => log('You have pressed the button'),
//                   materialTapTargetSize: MaterialTapTargetSize.padded,
//                   backgroundColor: Colors.green,
//                   child: const Icon(Icons.map, size: 30.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart' as ph;

// class MapApp extends StatefulWidget {
//   const MapApp({super.key});

//   @override
//   _MapAppState createState() => _MapAppState();
// }

// class _MapAppState extends State<MapApp> {
//   late GoogleMapController myController;
//   final LatLng _center = const LatLng(45.521563, -122.677433);
//   bool _locationPermissionGranted = false;
//   final Set<Marker> _markers = {};
//   late LocationData _currentLocation;

//   // Location instance to access the current location
//   Location location = Location();

//   void _onMapCreated(GoogleMapController controller) {
//     myController = controller;
//     _setInitialLocation();
//   }

//   Future<void> checkPermissions() async {
//     var status = await ph.Permission.location.status; // Use alias 'ph'
//     if (status.isGranted) {
//       setState(() {
//         _locationPermissionGranted = true;
//       });
//     } else {
//       var result = await ph.Permission.location.request(); // Use alias 'ph'
//       setState(() {
//         _locationPermissionGranted = result.isGranted;
//       });
//     }
//   }

//   Future<void> _setInitialLocation() async {
//     // Check if location service is enabled
//     bool serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) return;
//     }

//     // Check for location permission using location's PermissionStatus
//     PermissionStatus permissionGranted = await location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) return;
//     }

//     // Get the current location
//     _currentLocation = await location.getLocation();

//     // Move the camera to the user's current location
//     myController.animateCamera(
//       CameraUpdate.newLatLng(
//         LatLng(_currentLocation.latitude!, _currentLocation.longitude!),
//       ),
//     );

//     // Add a marker at the current location
//     setState(() {
//       _markers.add(
//         Marker(
//           markerId: const MarkerId('current_location'),
//           position:
//               LatLng(_currentLocation.latitude!, _currentLocation.longitude!),
//           infoWindow: const InfoWindow(
//             title: 'Your Location',
//           ),
//           icon:
//               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
//         ),
//       );
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     checkPermissions();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter Maps with Current Location'),
//           backgroundColor: Colors.green,
//         ),
//         body: _locationPermissionGranted
//             ? Stack(
//                 children: <Widget>[
//                   GoogleMap(
//                     myLocationButtonEnabled: true,
//                     myLocationEnabled: true,
//                     onMapCreated: _onMapCreated,
//                     markers: _markers, // Add the markers to the map
//                     initialCameraPosition: CameraPosition(
//                       target: _center,
//                       zoom: 15.0,
//                     ),
//                     onTap: (LatLng position) {
//                       // Add a marker where the user taps on the map
//                       setState(() {
//                         _markers.add(
//                           Marker(
//                             markerId: MarkerId(position.toString()),
//                             position: position,
//                             infoWindow: InfoWindow(
//                               title: 'New Marker',
//                               snippet:
//                                   'Position: ${position.latitude}, ${position.longitude}',
//                             ),
//                             icon: BitmapDescriptor.defaultMarkerWithHue(
//                               BitmapDescriptor.hueBlue,
//                             ),
//                           ),
//                         );
//                       });
//                     },
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(14.0),
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: FloatingActionButton(
//                         onPressed: _setInitialLocation,
//                         materialTapTargetSize: MaterialTapTargetSize.padded,
//                         backgroundColor: Colors.green,
//                         child: const Icon(Icons.my_location, size: 30.0),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             : const Center(
//                 child: Text(
//                   'Location permission is required to use the map.',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final LatLng _center = const LatLng(45.521563, -122.677433);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(target: _center, zoom: 15)),
    );
  }
}
