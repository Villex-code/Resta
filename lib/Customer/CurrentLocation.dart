import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'dart:math';

class NewCurrentLocationScreen extends StatefulWidget {
  NewCurrentLocationScreen({Key? key}) : super(key: key);
  @override
  _NewCurrentLocationScreenState createState() => _NewCurrentLocationScreenState();
}

class _NewCurrentLocationScreenState extends State<NewCurrentLocationScreen> {
  late GoogleMapController googleMapController;
  List<String> storesNames = ['juicy','mac','goodys','mac','goodys'];
  List<String> storesDescriptions = ['good food','bad food','good drink','bad food','good drink'];
  final List<LatLng> _lastlang = [LatLng(37.985169, 23.762654),LatLng(37.989366, 23.766973),LatLng(37.988593, 23.757367)];
  CustomInfoWindowController infoWindowController =
  CustomInfoWindowController();
  Set<Marker> markers = {};
  //BitmapDescriptor markerBitMap = BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(94,94), " "));

  /* static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );*/

  @override
  void initState() {
    super.initState();
    // infoWindowController = CustomInfoWindowController();
    loadData();
  }

  loadData() async{
    //Position position = await _determinePosition();
    for (int i = 0; i < _lastlang.length; i++) {
      markers.add(Marker(markerId: MarkerId(i.toString()),
          icon: BitmapDescriptor.defaultMarker,
          position: _lastlang[i],
          onTap: (){
            infoWindowController.addInfoWindow!(
                Container(
                  height: 300,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage('https://picsum.photos/seed/202/600'),
                              fit: BoxFit.fitWidth,
                              filterQuality: FilterQuality.high),
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10, left: 10,right: 10),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                'Beef Tacos',
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                            ),
                            const Spacer(),
                            RatingBar.builder(
                              onRatingUpdate: (newValue) => setState(() => newValue),
                              itemBuilder: (context, index) => Icon(
                                Icons.star_rounded,
                                color: Colors.pink,
                              ),
                              direction: Axis.horizontal,
                              initialRating: 3,
                              unratedColor: Colors.black,
                              itemCount: 5,
                              itemSize: 26,
                              glowColor: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top:10, left: 10,right: 10),
                          child: Text(
                            'Description',
                            maxLines: 2,
                          )
                      ),
                    ],
                  ),
                ),
                _lastlang[i]
            );
          }));
    }

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
      body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(37.986497, 23.758879),
                  zoom: 15
              ),
              markers: markers,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                infoWindowController.googleMapController = controller;
              },
              onCameraMove: (position){
                infoWindowController.onCameraMove!();
              },
              onTap: (position) {
                infoWindowController.hideInfoWindow!();
              },
            ),
            CustomInfoWindow(controller: infoWindowController,
              height: 200,
              width: 300,
              offset: 35,),
          ]
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



          // Generate and add additional markers with custom info windows
          for (int i = 1; i <= 5; i++) {
            double lat = position.latitude + (0.001 * i);
            double lng = position.longitude + (0.001 * i);

            markers.add(
              Marker(
                  markerId: MarkerId('marker$i'),
                  position: LatLng(lat, lng),
                  onTap: () {
                    infoWindowController.addInfoWindow!(
                      Text('ok'),
                      LatLng(lat, lng),
                    );
                  }
              ),);
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

  bool isLocationWithin1km(double currentLatitude, double currentLongitude, double spotLatitude, double spotLongitude) {
    const double earthRadius = 6371; // Radius of the Earth in kilometers
    final double latDistance = degreesToRadians(spotLatitude - currentLatitude);
    final double lonDistance = degreesToRadians(spotLongitude - currentLongitude);
    final double a = sin(latDistance / 2) * sin(latDistance / 2) +
        cos(degreesToRadians(currentLatitude)) * cos(degreesToRadians(spotLatitude)) * sin(lonDistance / 2) * sin(lonDistance / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    final double distance = earthRadius * c;

    return distance < 1.0; // Check if the distance is less than 1km
  }

  double degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

}