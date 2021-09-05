import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';
import 'dart:convert';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.url);

  final url;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void initState() {
    super.initState();
    updateUI(widget.url);
  }

  WeatherModel mymodel = WeatherModel();
  double temp;
  int temperature;
  String weatherIcon;
  String weathermessage;
  String cityName;

  void updateUI(dynamic weatherdataFuture) async {
    if (weatherdataFuture == null) {
      temperature = 0;
      weatherIcon = 'Error';
      weathermessage = 'Unable to fetch';
      cityName = ' ';
      return;
    }
    //sessions[1].available_capacity_dose1
    final weatherdata = await weatherdataFuture;
    double temp = weatherdata['main']['temp'];
    temperature = temp.toInt();
    var condition = weatherdata['weather'][0]['id'];
    print(condition);
    weatherIcon = mymodel.getWeatherIcon(condition);
    print(weatherIcon);
    weathermessage = mymodel.getMessage(temperature);
    cityName = weatherdata['name'];
    setState(() {});
  }

  String tempString() {
    if (temperature == null) {
      return 'Hi';
    } else {
      return '$temperature';
    }
  }

  String weathermessagefun() {
    if (weathermessage != null) {
      return '$weathermessage if you are in $cityName' ?? 'Loading';
    } else {
      return 'Check cityname or connection.';
    }
  }

  String getweathericon() {
    if (weatherIcon == null) {
      return 'X';
    } else {
      return weatherIcon;
    }
  }

  // String weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var newUI = await mymodel.getLocationData();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LocationScreen(newUI);
                      }));
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typenamed = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (typenamed != null) {
                        var newUI = WeatherModel().getCityData(typenamed);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LocationScreen(newUI);
                        }));
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      tempString(),
                      style: kTempTextStyle,
                    ),
                    Text(
                      getweathericon(),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  weathermessagefun(),
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
