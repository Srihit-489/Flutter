import 'package:clima/screens/location_screen.dart';

import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var avildata = await weatherModel.getLocationData();
    print('everything is ok here3');

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(avildata);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPouringHourglass(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
