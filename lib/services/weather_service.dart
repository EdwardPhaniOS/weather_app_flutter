import 'location.dart';
import 'networking.dart';

class WeatherService {
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = 'd6bfb8d977a825aeb92cb1aa0e2b869e';

  Future<dynamic> getWeatherByCurrentLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    var url =
        '$baseUrl?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey';

    var weatherData = await NetworkingHelper(url).getData();
    return weatherData;
  }

  Future<dynamic> getWeatherByCityName(String cityName) async {
    Location location = Location();
    await location.getCurrentLocation();

    var url = '$baseUrl?q=$cityName&units=metric&appid=$apiKey';

    var weatherData = await NetworkingHelper(url).getData();
    return weatherData;
  }
}