import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;
  CustomInfoWindowController infoWindowController =
      CustomInfoWindowController();
  Set<Marker> markers = {};
  //BitmapDescriptor markerBitMap = BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(94,94), " "));

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();
    infoWindowController = CustomInfoWindowController();
  }

  @override
  void dispose() {
    infoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User current location"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        onTap: (LatLng latLng) {
          infoWindowController.hideInfoWindow!();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _determinePosition();

          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14,
              ),
            ),
          );

          markers.clear();

          markers.add(
            Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude),
              infoWindow: const InfoWindow(
                title: "This is the title",
                snippet: "This is the description",
              ),
              // onTap: () {
              //   infoWindowController.addInfoWindow!(
              //     Container(
              //       height: 50,
              //     width: 70,
              //     child:SizedBox(
              //     child: Column(
              //       children: [
              //         Text("Custom Info Window"),
              //         Text("Additional details"),
              //       ],
              //     ),
              //   )
              //     ),
              //     LatLng(position.latitude, position.longitude),
              //   );
              // }
            ),
          );

          // Generate and add additional markers with custom info windows
          for (int i = 1; i <= 5; i++) {
            double lat = position.latitude + (0.001 * i);
            double lng = position.longitude + (0.001 * i);

            markers.add(
              Marker(
                markerId: MarkerId('marker$i'),
                position: LatLng(lat, lng),
                infoWindow: const InfoWindow(
                  title: "This is the title",
                  snippet: "This is the description",
                ),
                // onTap: () {
                //   infoWindowController.addInfoWindow!(
                //     Column(
                //       children: [
                //         Text("Marker $i"),
                //         Text("Additional details"),
                //       ],
                //     ),
                //     LatLng(lat, lng),
                //   );
                // },
              ),
            );
          }

          setState(() {});
        },
        label: const Text("Current Location"),
        icon: const Icon(Icons.location_history),
      ),
      // Add CustomInfoWindow widget to display the custom info window
      // positioned according to the tapped marker
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}

// class CustomInfoWindow extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200.0,
//       height: 150.0,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Column(
//         children: [
//           // Replace this with your image widget
//           Image.asset(
//             'https://media.istockphoto.com/id/1209654046/vector/user-avatar-profile-icon-black-vector-illustration.jpg?s=612x612&w=0&k=20&c=EOYXACjtZmZQ5IsZ0UUp1iNmZ9q2xl1BD1VvN6tZ2UI=',
//             width: 120.0,
//             height: 80.0,
//           ),
//           SizedBox(height: 8.0),
//           Text(
//             'Custom Info Window',
//             style: TextStyle(
//               fontSize: 16.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 4.0),
//           Text(
//             'This is a custom info window.',
//             style: TextStyle(fontSize: 12.0),
//           ),
//         ],
//       ),
//     );
//   }
// }