import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  double longitude;
  double latitude;
  Position myposition;

  void getLocation() async {
    try {
      myposition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(myposition);
    } catch (e) {
      print(e);
    }
    latitude = myposition.latitude;
    longitude = myposition.latitude;
  }

  void initState() {
    super.initState();
    getLocation();
    print(latitude);
    print(longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}
