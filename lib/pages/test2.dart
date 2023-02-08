import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("gps_location").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              final locations = snapshot.data.docs.map((doc) => doc.data());
              for (var location in locations) {
                final marker = Marker(
                  markerId: MarkerId(location["id"].toString()),
                  position: LatLng(location["latitude"], location["longitude"]),
                  infoWindow: InfoWindow(
                    title: location["name"],
                  )
                );
                _markers.add(marker);
              }
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(locations[0]['latitude'], locations[0]['longitude']),
                  zoom: 10.0,
                ),
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  setState(() {
                    mapController = controller;
                  });
                },
              );
            },
          ),
        );
  }
}
