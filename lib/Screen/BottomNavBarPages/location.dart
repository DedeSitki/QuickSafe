import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late GoogleMapController _controller;

  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(_originLatitude, _originLongitude),
    zoom: 15,
  );

  static const double _originLatitude = 41.181797;
  static const double _originLongitude = 27.817872;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: _initialCameraPosition,
            tiltGesturesEnabled: true,
            compassEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                _controller = controller;
              });
            },
            markers: _createMarkers(),
          ),
          Positioned(
            bottom: 100,
            right: 10,
            child: FloatingActionButton(
              onPressed: _shareLocation,
              child: Icon(Icons.share),
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> _createMarkers() {
    return <Marker>{
      Marker(
        infoWindow: InfoWindow(title: "ÇMF"),
        markerId: MarkerId("ev"),
        position: LatLng(41.181797, 27.817872),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    };
  }

  void _shareLocation() {
    _launchURL("sms:05309602743?body=Merhaba, tehlikede hissediyorum. Bu benim konumum. https://maps.google.com/?q=41.181797,27.817872");
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
