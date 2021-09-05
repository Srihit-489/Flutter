import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getLocation() async {
    try {
      Position myposition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      latitude = myposition.latitude;
      longitude = myposition.longitude;
    } catch (e) {
      print(e);
    }
  }
}
