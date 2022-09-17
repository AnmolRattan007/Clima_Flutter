import 'package:clima/services/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'networking.dart';

class Location {
  double? lat;
  double? long;

  Future<void> getLocation() async {
    LocationPermission permission;

    permission = await Geolocator.requestPermission();
    Position loc = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    lat = loc.latitude;
    long = loc.longitude;
  }

  static Future<WeatherModel> getcurrLocationData() async {
    Position loc = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    var data = await NetworkingHelper(
            lat: loc.latitude.toString(), long: loc.longitude.toString())
        .getData();
    return WeatherModel(dict: data);
  }
}
