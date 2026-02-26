import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../services/weather.dart';
import '../services/weather_service.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    geLocationData();
  }

  void geLocationData() async {
    context.loaderOverlay.show();

    var weatherService = WeatherService();
    var weatherData = await weatherService.getWeatherByCurrentLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      var weatherModel = WeatherModel.fromJSON(weatherData);
      return LocationScreen(weatherModel);
    }));

    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
