import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    // Location loc = Location();
    // await loc.getLocation();
    // print(loc.lat);
    // print(loc.long);
    var data = await NetworkingHelper(lat: '44.34', long: '10.99').getData();
    final weatherModel = WeatherModel(dict: data);

    if (!mounted) {
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        model: weatherModel,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    print("initialization completed");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
