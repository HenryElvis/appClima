import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/networking.dart';
import 'location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const keyId = '59709b06b30ca6984f3d7a9ad8da18a5';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    GetLocationData();
  }

  void GetLocationData() async {
    Location location = Location();

     await location.GetCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('http://api.openweathermap.org/'
        'data/2.5/'
        'weather?lat=${location.latitude}&lon='
        '${location.longitude}&appid=$keyId&units=metric');

    var weatherData = await networkHelper.GetData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,);
    },),);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
