import 'location.dart';
import 'package:clima/services/networking.dart';
import 'dart:core';
import 'package:intl/intl.dart';

class WeatherModel {
  Future<dynamic> getCityData(String citylocation) async {
    String link =
        'https://api.openweathermap.org/data/2.5/weather?q=$citylocation&appid=f67b4c5eaa8506602727d947c5552e47&units=metric';
    NetworkHelper networkHelper = NetworkHelper(link);
    var newWeatherData = await networkHelper.getData();
    return newWeatherData;
  }

  Future<dynamic> getLocationData() async {
    Location mylocation = Location();
    await mylocation.getLocation();
    // var now = new DateTime.now();
    // print(now);
    // var formatter = new DateFormat('dd-MM-yyyy');
    // String formattedDate = formatter.format(now);
    // print(formattedDate);
    String link =
        'https://api.openweathermap.org/data/2.5/weather?lat=${mylocation.latitude.toInt()}&lon=${mylocation.longitude.toInt()}&appid=f67b4c5eaa8506602727d947c5552e47&units=metric';

    NetworkHelper networkHelper = NetworkHelper(link);
    var avildata = await networkHelper.getData();
    print('everthing is fine upto here 2');
    return avildata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
